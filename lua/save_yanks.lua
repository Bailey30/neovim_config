local M = {}
local unset = -1

-- Util function to split string
local function split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local arr = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(arr, str)
	end
	return arr
end

local function merge_tables(table_1, table_2)
	local new_table = {}
	for key, value in pairs(table_1) do
		new_table[key] = value
	end
	for key, value in pairs(table_2) do
		new_table[key] = value
	end
	return new_table
end

local config = {
	hints = {
		-- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
		---@type string
		dictionary = "sadftewcmpguio",
	},
	layout = {
		style = {
			padding = 1,
		},
		window = {
			width = 50,
			height = 17,
			title = "Yanker",
			relative = "editor",
			anchor = "SW",
			style = "minimal",
			border = "rounded",
			footer_pos = "right",
		},
	},
}

local function create_floating_window(item_count, layout_config)
	local width = 50
	local height = 17
	local buf = vim.api.nvim_create_buf(false, true)
	-- vim.api.nvim_buf_set_name(buf, "Yanker")
	local ui = vim.api.nvim_list_uis()[1] -- Info about the nvim window that is running.

	local win_opts = {
		col = ui.width - width - 1,
		row = ui.height - height / 3 - 1,
		footer = "1 / " .. item_count,
	}

	local win = vim.api.nvim_open_win(buf, false, merge_tables(win_opts, layout_config))

	vim.api.nvim_set_option_value("scrolloff", 2, {
		scope = "local",
		win = win,
	})

	return buf, win
end

local function get_cursor_position()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local row = cursor_pos[1] - 1 -- Convert to 0-indexed for extmarks.
	local col = cursor_pos[2]
	return row, col
end

local namespace = vim.api.nvim_create_namespace("cursor_line_highlight")

local function get_clipboard_contents()
	local contents = vim.fn.getreg("*")
	return contents
end

local function get_saved_yanks()
	local stdpath = vim.fn.stdpath("state")
	local file_contents = vim.fn.readfile(stdpath .. "/clipboard.txt")

	-- Create a reverse order list.
	local yank_list = {}
	for i = #file_contents, 1, -1 do
		if file_contents[i] ~= " " then
			local clean_string = file_contents[i]:gsub("\n", "↵")
			table.insert(yank_list, clean_string)
		end
	end

	return yank_list
end

local function change_mode(mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(mode, true, false, true), "n", false)
end

-- Creates a key/value table of search tags and yanked lines.
local function generate_yank_dict(yanks, tags)
	local lines = {}
	for i = 1, #tags do
		lines[tags:sub(i, i)] = yanks[i]
	end
	return lines
end

-- Creates an array of lines that include the search tag paired with the yanked line.
local function format_display_lines(display_lines, tags)
	local formatted_lines = {}
	for i = 1, #tags do
		formatted_lines[i] = string.format("%s:  %s", tags:sub(i, i), display_lines[i])
	end
	return formatted_lines
end

local Menu = {
	starting_mode = "",
	buf = unset,
	win = unset,
	working_buf = unset,
	yank_dict = {},
	yank_set = "tagged",
	displayed_yanks = {},
	formatted_lines = {},
	config = config,
}

Menu.__index = Menu

function Menu:new(o)
	o = o or {}
	setmetatable(o, Menu)
	return o
end

function Menu:open_window()
	-- Add contents to buffer.
	vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, self.formatted_lines)
	self.displayed_yanks = self.formatted_lines

	-- Move focus to new buffer.
	vim.api.nvim_set_current_win(self.win)
	vim.api.nvim_win_set_cursor(self.win, { 1, 0 })

	-- Switch to normal mode in the new buffer.
	change_mode("<C-c>")

	-- Set keymaps that controls functions of the menu.
	self:set_keymaps()

	-- Highlight line when cursor moves
	vim.api.nvim_create_autocmd("CursorMoved", {
		buffer = self.buf,
		callback = function()
			self:highlight_line()
		end,
	})
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

	-- Insert selection on enter pressed.
	vim.keymap.set("n", "<CR>", function()
		self:put_yank(self:get_yank_from_set())
	end, { nowait = true, buffer = self.buf })

	-- Just yank and close when y pressed.
	vim.keymap.set("n", "y", function()
		self:yank(self:get_yank_from_set())
	end, { nowait = true, buffer = self.buf })

	-- Close buffer when esc pressed.
	vim.keymap.set("n", "<ESC>", function()
		self:close()
	end, { nowait = true, buffer = self.buf })

	vim.keymap.set("n", "<C-c>", function()
		self:close()
	end, { nowait = true, buffer = self.buf })

	-- Change between displaying all yanks or a set of yanks with tags.
	vim.keymap.set("n", "<C-r>", function()
		self:swap_yank_set()
	end, { nowait = true, buffer = self.buf })
end

-- Handles getting the yank from the displayed list depending on the current mode.
function Menu:get_yank_from_set()
	local selected_yank
	if self.yank_set == "tagged" then
		selected_yank = self.yank_dict[self:get_yank_tag()]
	else
		selected_yank = self:select_yank()
	end
	return selected_yank
end

-- Changes the displayed yanks to either the most recent yanks with tags or all yanks history.
function Menu:swap_yank_set()
	local selected_yank_set

	if self.yank_set == "tagged" then
		selected_yank_set = get_saved_yanks()
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
end

-- Gets the yank from the list as it appears.
function Menu:select_yank()
	local row = get_cursor_position()
	local yank = vim.api.nvim_buf_get_lines(self.buf, row, row + 1, true)[1]
	return yank
end

-- Gets the yank from the buffer and returns the first character which is the tag.
function Menu:get_yank_tag()
	local row = get_cursor_position()
	local yank = vim.api.nvim_buf_get_lines(self.buf, row, row + 1, true)[1]
	return yank:sub(1, 1)
end

-- Inserts yank into the location of the cursor when the Yanker window was opened.
function Menu:put_yank(yank_to_put)
	local working_buf = self.working_buf
	self:close()

	local working_row, working_col = get_cursor_position()
	local working_line = vim.api.nvim_get_current_line()

	if string.find(yank_to_put, "↵") then
		vim.api.nvim_buf_set_lines(working_buf, working_row + 1, working_row + 1, false, split(yank_to_put, "↵"))
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
	vim.api.nvim_buf_delete(self.buf, {})

	-- Ensure neovim is in insert mode when returning to the working buffer.
	if self.starting_mode == "i" then
		change_mode("i")
	end

	self.buf = unset
	self.working_buf = unset
	self.win = unset
end

-- Apply highlights.
function Menu:highlight_line()
	-- Clear previous highlights in our namespace.
	vim.api.nvim_buf_clear_namespace(self.buf, namespace, 0, -1)

	-- Get the current cursor position.
	local row = get_cursor_position()

	local end_col = vim.fn.strlen(vim.fn.getline("."))

	-- Set an extmark that highlights the yank line.
	vim.api.nvim_buf_set_extmark(self.buf, namespace, row, 4, {
		hl_group = "Search", -- Your highlight group.
		hl_eol = true, -- Extend the highlight to the end of the line.
		end_row = row,
		end_col = end_col,
		strict = false,
		hl_mode = "combine",
	})

	-- Apply highlights to the tags.
	if self.yank_set == "tagged" then
		for index = 0, #self.formatted_lines - 1 do
			print(vim.inspect(index))
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

local Yanker = {}
function Yanker.init()
	local saved_yanks = get_saved_yanks()
	local yank_dict = generate_yank_dict(saved_yanks, config.hints.dictionary)
	local formatted_lines = format_display_lines(saved_yanks, config.hints.dictionary)

	local starting_mode = vim.fn.mode()

	-- Create a floating window and open it.
	local buf, win = create_floating_window(#formatted_lines, config.layout.window)

	-- Get the buffer you are working in.
	local working_buf = vim.api.nvim_get_current_buf()

	-- Create a new instane of Menu.
	local menu = Menu:new({
		win = win,
		buf = buf,
		starting_mode = starting_mode,
		working_buf = working_buf,
		yank_dict = yank_dict,
		formatted_lines = formatted_lines,
	})

	menu:open_window()
end

vim.keymap.set({ "n", "i" }, "<leader>pl", function()
	Yanker.init()
end)

function M.save_yank_to_file()
	local stdpath = vim.fn.stdpath("state")
	local file_contents = get_clipboard_contents()
	vim.fn.writefile({ vim.fn.trim(file_contents, "\n") }, stdpath .. "/clipboard.txt", "a")
end

return M
