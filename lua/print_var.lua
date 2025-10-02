local Varp = {}

-- Define a global Lua function (so it can be called by "v:lua.my_custom_operator").
-- Gets the selection based on the given vim motion.
function _G.get_selection(type)
	-- 'type' can be 'char', 'line', or 'block' indicating how the text was selected.
	-- For the text range, Neovim uses special marks '[ and '] to indicate the start
	-- and end of the operated region.

	local pos_start = vim.api.nvim_buf_get_mark(0, "[")
	local pos_finish = vim.api.nvim_buf_get_mark(0, "]")

	local start = {
		row = pos_start[1],
		col = pos_start[2],
	}
	local finish = {
		row = pos_finish[1],
		col = pos_finish[2],
	}

	local text = vim.api.nvim_buf_get_text(0, start.row - 1, start.col, finish.row - 1, finish.col + 1, {})
	Varp.print_var(text[1])
end

-- - A small helper function that sets the operatorfunc and then triggers g@
function Varp.call_get_selection()
	vim.go.operatorfunc = "v:lua.get_selection"

	-- Feed the "g@" keystroke so the user can choose a motion next.
	vim.api.nvim_feedkeys("g@", "mi", false)
end

---@param text string
function Varp.print_var(text)
	local line = vim.fn.line(".")
	local indent = string.rep(" ", vim.fn.indent(vim.fn.line(".")))
	local to_print = (indent .. 'print("' .. text .. ':",' .. text .. ")")
	vim.api.nvim_buf_set_lines(0, line, line, false, { to_print })
end

function Varp:get_highlighted_var()
	vim.cmd.normal({ '"zy', bang = true })
	local selection = vim.fn.getreg("z")
	self.print_var(selection)
end

vim.keymap.set("n", "<leader>x", function()
	Varp:call_get_selection()
end, { desc = "Varp" })

vim.keymap.set("v", "<leader>pv", function()
	Varp:get_highlighted_var()
end)

return Varp
