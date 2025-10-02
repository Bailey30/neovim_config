-- Minimal implementation of Substitute.nvim

local Substitute = {}

-- Define a global Lua function (so it can be called by "v:lua.my_custom_operator").
function _G.my_custom_operator(type)
	-- 'type' can be 'char', 'line', or 'block' indicating how the text was selected.
	-- For the text range, Neovim uses special marks '[ and '] to indicate the start
	-- and end of the operated region.

	local pos_start = vim.api.nvim_buf_get_mark(0, "[")
	local pos_finish = vim.api.nvim_buf_get_mark(0, "]")

	local marks = {
		start = {
			row = pos_start[1],
			col = pos_start[2],
		},
		finish = {
			row = pos_finish[1],
			col = pos_finish[2],
		},
	}

	local regcontents = vim.fn.getreg("*")
	Substitute.replace_text(regcontents, marks)
end

-- - A small helper function that sets the operatorfunc and then triggers g@
function Substitute.call_my_custom_operator()
	vim.go.operatorfunc = "v:lua.my_custom_operator"

	-- Feed the "g@" keystroke so the user can choose a motion next.
	vim.api.nvim_feedkeys("g@", "mi", false)
end

---@param text string
---@param marks table
function Substitute.replace_text(text, marks)
	local start, finish = marks.start, marks.finish
	vim.api.nvim_buf_set_text(0, start.row - 1, start.col, finish.row - 1, finish.col + 1, { vim.fn.trim(text) })
end

vim.keymap.set("n", "s", function()
	Substitute:call_my_custom_operator()
end, { desc = "Substitute" })

return Substitute
