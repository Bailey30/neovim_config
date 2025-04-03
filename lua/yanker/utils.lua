local lua_utils = {}

-- Util function to split string
function lua_utils.split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local arr = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(arr, str)
	end
	return arr
end

function lua_utils.merge_tables(table_1, table_2)
	local new_table = {}
	for key, value in pairs(table_1) do
		new_table[key] = value
	end
	for key, value in pairs(table_2) do
		new_table[key] = value
	end
	return new_table
end

local nvim_utils = {}
function nvim_utils.get_cursor_position()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local row = cursor_pos[1] - 1 -- Convert to 0-indexed for extmarks.
	local col = cursor_pos[2]
	return row, col
end

function nvim_utils.change_mode(mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(mode, true, false, true), "n", false)
end

function nvim_utils.get_register_contents()
	local contents = vim.fn.getreg("*")
	return contents
end

local window_utils = {}
function window_utils.create_floating_window(item_count, layout_config)
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

	local win = vim.api.nvim_open_win(buf, false, lua_utils.merge_tables(win_opts, layout_config))

	vim.api.nvim_set_option_value("scrolloff", 2, {
		scope = "local",
		win = win,
	})

	return buf, win
end

local yank_utils = {}

-- Creates a key/value table of search tags and yanked lines.
function yank_utils.generate_yank_dict(yanks, tags)
	local lines = {}
	for i = 1, #tags do
		lines[tags:sub(i, i)] = yanks[i]
	end
	return lines
end

-- Creates an array of lines that include the search tag paired with the yanked line.
function yank_utils.format_display_lines(display_lines, tags)
	local formatted_lines = {}
	for i = 1, #tags do
		formatted_lines[i] = string.format("%s:  %s", tags:sub(i, i), display_lines[i])
	end
	return formatted_lines
end

return {
	nvim_utils = nvim_utils,
	yank_utils = yank_utils,
	lua_utils = lua_utils,
	window_utils = window_utils,
}
