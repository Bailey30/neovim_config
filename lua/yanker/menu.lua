local History = require("yanker.history")
local utils = require("yanker.utils")
local lua_utils = utils.lua_utils
local window_utils = utils.window_utils
local yank_utils = utils.yank_utils
local nvim_utils = utils.nvim_utils

local namespace = vim.api.nvim_create_namespace("cursor_line_highlight")
local unset = -1

local Menu = {
	-- Program state
	starting_mode = "",
	buf = unset,
	win = unset,
	working_buf = unset,
	yank_dict = {},
	yank_set = "tagged",
	displayed_yanks = {},
	formatted_lines = {},
	index = 1, -- 1 indexed for "mark-like" row indexing

	-- Setup configuration
	config = {
		highlight_indent = {
			tagged = 4,
			all = 0,
		},
	},
}

Menu.__index = Menu

function Menu:new(config)
	local o = setmetatable({}, Menu)
	o.config = vim.tbl_deep_extend("keep", config or {}, self.config)
	return o
end

function Menu:create_state()
	-- Load the saved yanks from the file.
	local saved_yanks = History.get()
	-- Create a key/value set of yanks with tags.
	self.yank_dict = yank_utils.generate_yank_dict(saved_yanks, self.config.hints.dictionary)
	-- Format the yanks with tags to appear on buffer.
	self.formatted_lines = yank_utils.format_display_lines(saved_yanks, self.config.hints.dictionary)
	-- Neovim mode when starting Yanker.
	self.starting_mode = vim.fn.mode()
	-- Get the buffer you are working in.
	self.working_buf = vim.api.nvim_get_current_buf()
	-- Create a floating window and open it.
	self.buf, self.win = window_utils.create_floating_window(#self.formatted_lines, self.config.layout.window)
end

function Menu:open()
	self:create_state()
	self:setup_highlights()
	self:hide_cursor()

	-- Add contents to buffer.
	vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, self.formatted_lines)
	self.displayed_yanks = self.formatted_lines

	-- Move focus to new buffer.
	vim.api.nvim_set_current_win(self.win)
	vim.api.nvim_win_set_cursor(self.win, { 1, 0 })

	-- Switch to normal mode in the new buffer.
	nvim_utils.change_mode("<C-c>")

	-- Set keymaps that controls functions of the menu.
	self:set_keymaps()

	self:highlight_line()
end

local function keymap_array(group)
	local keymaps = nil
	if type(group) == "string" then
		keymaps = { group }
	else
		keymaps = group
	end
	return keymaps
end

function Menu:set_keymaps()
	-- Keymaps for the letter tags.
	for tag, line in pairs(self.yank_dict) do
		vim.keymap.set("n", tag, function()
			if self.yank_set == "tagged" then
				self:put_yank(line)
			end
		end, { nowait = true, buffer = self.buf })
	end

	local keymaps = self.config.keymaps
	local up, down, put, close, yank, change_yank_set =
		keymaps.up, keymaps.down, keymaps.put, keymaps.close, keymaps.yank, keymaps.change_yank_set

	-- "Up" keymaps
	for _, keymap in ipairs(keymap_array(up)) do
		vim.keymap.set("n", keymap, function()
			self:up()
		end, { nowait = true, buffer = self.buf })
	end

	-- "Down" keymaps
	for _, keymap in ipairs(keymap_array(down)) do
		vim.keymap.set("n", keymap, function()
			self:down()
		end, { nowait = true, buffer = self.buf })
	end

	-- "Put" keymaps
	for _, keymap in ipairs(keymap_array(put)) do
		vim.keymap.set("n", keymap, function()
			self:put_yank(self.displayed_yanks[self.index])
		end, { nowait = true, buffer = self.buf })
	end

	-- "Yank" keymaps
	for _, keymap in ipairs(keymap_array(yank)) do
		vim.keymap.set("n", keymap, function()
			self:yank(self.displayed_yanks[self.index])
		end, { nowait = true, buffer = self.buf })
	end

	-- "Close" keymaps
	for _, keymap in ipairs(keymap_array(close)) do
		vim.keymap.set("n", keymap, function()
			self:close()
		end, { nowait = true, buffer = self.buf })
	end

	-- "Change yank set" keymaps
	for _, keymap in ipairs(keymap_array(change_yank_set)) do
		vim.keymap.set("n", keymap, function()
			self:swap_yank_set()
		end, { nowait = true, buffer = self.buf })
	end
end

-- NOT IN USE --
-- Handles getting the yank from the displayed list depending on the current mode.
-- When pressing <CR> but not with tags.
function Menu:get_yank_from_set()
	local selected_yank
	if self.yank_set == "tagged" then
		selected_yank = self.yank_dict[self:get_yank_tag()]
	else
		selected_yank = self.displayed_yanks[self.index]
	end
	return selected_yank
end

-- Changes the displayed yanks to either the most recent yanks with tags or all yanks history.
function Menu:swap_yank_set()
	local selected_yank_set

	if self.yank_set == "tagged" then
		selected_yank_set = History.get()
		self.yank_set = "all"
	else
		selected_yank_set = self.formatted_lines
		self.yank_set = "tagged"
	end

	vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, selected_yank_set)

	self.displayed_yanks = selected_yank_set

	vim.api.nvim_set_option_value("number", self.yank_set ~= "tagged", {
		scope = "local",
		win = self.win,
	})

	self:set_index(1)
end

-- NOT IN USE--
-- Gets the yank from the list as it appears.
function Menu:select_yank()
	local row = nvim_utils.get_cursor_position()
	local yank = vim.api.nvim_buf_get_lines(self.buf, row, row + 1, true)[1]
	return yank
end

-- Gets the yank from the buffer and returns the first character which is the tag.
function Menu:get_yank_tag()
	local row = nvim_utils.get_cursor_position()
	local yank = vim.api.nvim_buf_get_lines(self.buf, self.index - 1, self.index, true)[1]
	return yank:sub(1, 1)
end

-- Inserts yank into the location of the cursor when the Yanker window was opened.
function Menu:put_yank(yank_to_put)
	local working_buf = self.working_buf
	self:close()

	local working_row, working_col = nvim_utils.get_cursor_position()
	local working_line = vim.api.nvim_get_current_line()

	-- If yank is multi-line, insert below. Otherwise insert into line.
	if string.find(yank_to_put, "↵") then
		vim.api.nvim_buf_set_lines(
			working_buf,
			working_row + 1,
			working_row + 1,
			false,
			lua_utils.split(yank_to_put, "↵")
		)
	else
		vim.api.nvim_set_current_line(
			working_line:sub(0, working_col + 1) .. yank_to_put .. working_line:sub(working_col + 2)
		)
	end
end

-- Put the selected yank into the clipboard and close the window.
function Menu:yank(yanked_yank)
	vim.fn.setreg("*", yanked_yank)
	self:close()
end

function Menu:close()
	self:set_index(1)
	vim.api.nvim_buf_delete(self.buf, {})

	-- Ensure neovim is in insert mode when returning to the working buffer.
	if self.starting_mode == "i" then
		nvim_utils.change_mode("i")
	end

	self.buf = unset
	self.working_buf = unset
	self.win = unset
	self.yank_set = "tagged"

	self:restore_cursor()
end

function Menu:set_index(i)
	self.index = i
	self:highlight_line()
end

function Menu:up()
	if self.index > 1 then
		self.index = self.index - 1
	end
	self:highlight_line()
end

function Menu:down()
	if self.index < #self.displayed_yanks then
		self.index = self.index + 1
	end
	self:highlight_line()
end

local cursor_cache = {
	guicursor = nil,
}

function Menu:hide_cursor()
	-- Save current cursor setting
	if vim.o.guicursor then
		cursor_cache.guicursor = vim.o.guicursor
	end
	-- Set cursor invisible
	vim.o.guicursor = "a:CursorHidden"
end

function Menu:restore_cursor()
	if cursor_cache.guicursor == "" then
		vim.o.guicursor = "a:"
		cursor_cache.guicursor = nil -- Prevent second block from executing
		vim.cmd("redraw")
		return
	end

	-- Restore original cursor setting
	if cursor_cache.guicursor then
		vim.o.guicursor = cursor_cache.guicursor
		cursor_cache.guicursor = nil
	end
end

function Menu:setup_highlights()
	vim.api.nvim_set_hl(0, "CursorHidden", { blend = 100, nocombine = true, underline = false })
end

-- Apply highlights.
function Menu:highlight_line()
	-- Clear previous highlights in our namespace.
	vim.api.nvim_buf_clear_namespace(self.buf, namespace, 0, -1)

	local row = self.index

	-- Manually set this so the window scrolls.
	vim.api.nvim_win_set_cursor(self.window, { self.index, 0 })

	local end_col = vim.fn.strlen(vim.fn.getline(row))

	-- Set an extmark that highlights the yank line.
	vim.api.nvim_buf_set_extmark(
		self.buf,
		namespace,
		row - 1, -- 0 indexed.
		self.config.highlight_indent[self.yank_set], -- Start col.
		{
			hl_group = "Search",
			hl_eol = true, -- Extend the highlight to the end of the line.
			end_row = row - 1,
			end_col = end_col,
			strict = false,
			hl_mode = "combine",
		}
	)

	-- TODO: create namespace for these highlights
	-- Apply highlights to the tags.
	if self.yank_set == "tagged" then
		for index = 0, #self.formatted_lines - 1 do
			vim.api.nvim_buf_set_extmark(self.buf, namespace, index, 0, {
				hl_group = "Boolean",
				end_row = index,
				end_col = 1,
				strict = true,
				hl_mode = "blend",
			})
		end
	end

	-- Update the counter at the bottom of the window.
	vim.api.nvim_win_set_config(self.win, {
		footer = row + 1 .. " / " .. #self.displayed_yanks,
	})
end

return Menu
