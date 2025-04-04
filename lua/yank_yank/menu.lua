local History = require("yank_yank.history")
local Cursor = require("yank_yank.cursor")
local utils = require("yank_yank.utils")
local lua_utils = utils.lua_utils
local window_utils = utils.window_utils
local yank_utils = utils.yank_utils
local nvim_utils = utils.nvim_utils

local namespace = vim.api.nvim_create_namespace("cursor_line_highlight")
local unset = -1

---@class Menu
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
	unformatted_lines = {},
	index = 1, -- 1 indexed for "mark-like" row indexing

	-- Setup configuration
	config = {
		highlight_indent = {
			tagged = 5,
			all = 0,
		},
		win_opts = {
			shared = { wrap = true, linebreak = true },
			set_based = {
				number = {
					tagged = false,
					all = true,
				},
				showbreak = {
					tagged = "  ",
					all = "",
				},
				breakindentopt = {
					tagged = "shift:2",
					all = "shift:0",
				},
				breakindent = {
					tagged = true,
					all = false,
				},
				statuscolumn = {
					tagged = "",
					a = " %l ",
				},
			},
		},
	},
}

Menu.__index = Menu

function Menu:new(config)
	local o = setmetatable({}, Menu)
	o.config = vim.tbl_deep_extend("keep", config or {}, self.config)
	return o
end

function Menu:set_state(state)
	-- Load the saved yanks from the file.
	local saved_yanks = History.get()
	self.unformatted_lines = saved_yanks
	-- Create a key/value set of yanks with tags.
	self.yank_dict = yank_utils.generate_yank_dict(saved_yanks, self.config.hints.dictionary)
	-- Format the yanks with tags to appear on buffer.
	self.formatted_lines = yank_utils.format_display_lines(saved_yanks, self.config.hints.dictionary)
	-- Neovim mode when starting yank_yank.
	self.starting_mode = vim.fn.mode()
	-- Get the buffer you are working in.
	self.working_buf = state.working_buf
	-- Create a floating window and open it.
	self.buf, self.win = window_utils.create_floating_window(#self.formatted_lines, self.config.layout.window)
end

function Menu:open(state)
	self:set_state(state)

	self:display_lines(self.formatted_lines)
	self:set_line_formatting()
	self:set_mode_formatting()

	-- Move focus to new buffer.
	vim.api.nvim_set_current_win(self.win)
	vim.api.nvim_win_set_cursor(self.win, { 1, 0 })

	-- Switch to normal mode in the new buffer.
	nvim_utils.change_mode("<C-c>")

	self:highlight_line()
end

function Menu:display_lines(selected_yank_set)
	vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, selected_yank_set)
	self.displayed_yanks = selected_yank_set
end

function Menu:set_line_formatting()
	for opt, value in pairs(self.config.win_opts.shared) do
		vim.api.nvim_set_option_value(opt, value, {
			scope = "local",
			win = self.win,
		})
	end
end

function Menu:set_mode_formatting()
	for opt, value in pairs(self.config.win_opts.set_based) do
		vim.api.nvim_set_option_value(opt, value[self.yank_set], {
			scope = "local",
			win = self.win,
		})
	end
end

-- Changes the displayed yanks to either the most recent yanks with tags or all yanks history.
function Menu:swap_yank_set()
	local selected_yank_set

	if self.yank_set == "tagged" then
		selected_yank_set = self.unformatted_lines
		self.yank_set = "all"
	else
		selected_yank_set = self.formatted_lines
		self.yank_set = "tagged"
	end

	self:display_lines(selected_yank_set)
	self:set_mode_formatting()

	-- Move back to the top of the list.
	self:set_index(1)
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

	Cursor:restore()
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

-- Apply highlights.
function Menu:highlight_line()
	-- Clear previous highlights in our namespace.
	vim.api.nvim_buf_clear_namespace(self.buf, namespace, 0, -1)

	local row = self.index

	-- Manually set this so the window scrolls.
	vim.api.nvim_win_set_cursor(self.win, { self.index, 0 })

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
			vim.api.nvim_buf_set_extmark(self.buf, namespace, index, 1, {
				hl_group = "Boolean",
				end_row = index,
				end_col = 2,
				strict = true,
				hl_mode = "blend",
			})
		end
	end

	-- Update the counter at the bottom of the window.
	vim.api.nvim_win_set_config(self.win, {
		footer = row .. " / " .. #self.displayed_yanks,
	})
end

return Menu
