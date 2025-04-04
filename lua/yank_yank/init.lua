local config = require("yank_yank.config")
local Menu = require("yank_yank.menu")
local History = require("yank_yank.history")
local System_Clipboard = require("yank_yank.system_clipboard")
local Cursor = require("yank_yank.cursor")
local lua_utils = require("yank_yank.utils").lua_utils

---@ class Yank_yank
local Yank_yank = {
	config = {},
	state = {
		cursor_position = nil,
		working_buf = nil,
		working_line = nil,
	},
}

function Yank_yank.setup(opts)
	config.setup(opts)
	Yank_yank.config = config

	Yank_yank.setup_highlights()
	Cursor:setup(Yank_yank.config.cursor)
	System_Clipboard.setup()

	Yank_yank.menu = Menu:new(Yank_yank.config)
	History:setup(Yank_yank.menu)
end

function Yank_yank.setup_highlights()
	vim.api.nvim_set_hl(0, "CursorHidden", { blend = 100, nocombine = true, underline = false })
	vim.api.nvim_set_hl(0, "YankYankPreserveCursor", { blend = 50, nocombine = true, underline = false, bg = "red" })
end

function Yank_yank.open()
	Yank_yank.state.working_buf = vim.api.nvim_get_current_buf()
	Yank_yank.state.working_line = vim.api.nvim_get_current_line()

	Cursor:hide(Yank_yank.state)

	Yank_yank.menu:open(Yank_yank.state)

	Yank_yank:set_keymaps()

	Yank_yank.setup_highlights()
end

function Yank_yank:put(yank, type)
	local working_row, working_col = Cursor.state.position.row, Cursor.state.position.col
	local working_line = self.state.working_line

	local put_pos = {
		append = 0,
		insert = 1,
	}

	-- If yank is multi-line, insert below. Otherwise insert into line.
	if string.find(yank, "↵") or type == "below" then
		if working_row then
			vim.api.nvim_buf_set_lines(
				self.state.working_buf,
				working_row,
				working_row,
				false,
				lua_utils.split(yank, "↵")
			)
		end
	else
		if working_line then
			vim.api.nvim_buf_set_text(
				Yank_yank.state.working_buf,
				working_row - 1, -- Convert to 0 index. vim.fn.getpos() get by 1 index.
				working_col - put_pos[type],
				working_row - 1,
				working_col - put_pos[type],
				{ vim.fn.trim(yank) }
			)
		end
	end

	Yank_yank.menu:close()
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

local function set_keymap(keymaps, func, buf)
	for _, keymap in ipairs(keymap_array(keymaps)) do
		vim.keymap.set("n", keymap, func, { nowait = true, buffer = buf })
	end
end

function Yank_yank:set_keymaps()
	local menu = Yank_yank.menu

	-- -- Keymaps for the letter tags.
	for tag, line in pairs(menu.yank_dict) do
		vim.keymap.set("n", tag, function()
			if menu.yank_set == "tagged" then
				Yank_yank:put(line, "append")
			end
		end, { nowait = true, buffer = menu.buf })
	end

	local keymaps = self.config.keymaps
	local up, down, append, insert, below, close, yank, change_yank_set =
		keymaps.up,
		keymaps.down,
		keymaps.append,
		keymaps.insert,
		keymaps.below,
		keymaps.close,
		keymaps.yank,
		keymaps.change_yank_set

	-- "Up" keymaps
	set_keymap(up, function()
		menu:up()
	end, menu.buf)

	-- "Down" keymaps
	set_keymap(down, function()
		menu:down()
	end, menu.buf)

	-- "Append" keymaps
	set_keymap(append, function()
		Yank_yank:put(menu.unformatted_lines[menu.index], "append")
	end, menu.buf)

	-- "Insert" keymaps
	set_keymap(insert, function()
		Yank_yank:put(menu.unformatted_lines[menu.index], "insert")
	end, menu.buf)

	-- "Below" keymaps
	set_keymap(below, function()
		Yank_yank:put(menu.unformatted_lines[menu.index], "below")
	end, menu.buf)

	-- "Yank" keymaps
	set_keymap(yank, function()
		menu:yank(menu.unformatted_lines[menu.index])
	end, menu.buf)

	-- "Close" keymaps
	set_keymap(close, function()
		menu:close()
	end, menu.buf)

	-- "Change yank set" keymaps
	set_keymap(change_yank_set, function()
		menu:swap_yank_set()
	end, menu.buf)
end

vim.keymap.set({ "n", "i" }, "<leader>pl", function()
	Yank_yank.open()
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		History:push()
	end,
})

-- Yank_yank.setup()

return Yank_yank
