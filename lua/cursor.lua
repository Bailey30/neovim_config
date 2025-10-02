local namespace = vim.api.nvim_create_namespace("insert_cursor_position")

local state = { guicursor = nil }

local function hide_cursor()
	-- Save current cursor setting

	if vim.o.guicursor then
		state.guicursor = vim.o.guicursor
	end
	-- Set cursor invisible
	vim.o.guicursor = "a:CursorHidden"
end

local function restore_cursor()
	if state.guicursor == "" or "a:CursorHidden" then
		-- print("guicursor was " .. (state.guicursor or ""))
		vim.o.guicursor = "a:"
		state.guicursor = nil -- Prevent second block from executing
		vim.cmd("redraw")
		return
	end

	-- Restore original cursor setting
	if state.guicursor then
		vim.o.guicursor = state.guicursor
		state.guicursor = nil
	end
end

local function insert_mode_cursor()
	local buf = vim.api.nvim_get_current_buf()

	vim.api.nvim_buf_clear_namespace(buf, namespace, 0, -1)

	hide_cursor()

	vim.api.nvim_set_hl(0, "CursorHidden", { blend = 100, nocombine = true, underline = false })
	vim.api.nvim_set_hl(0, "mode_cursor", { nocombine = true, underline = false, blend = 60, bg = "green" })
	local pos = vim.fn.getpos(".")
	local row = pos[2]
	local col = pos[3]

	vim.api.nvim_buf_set_extmark(buf, namespace, row - 1, col - 1, {
		virt_text = { { " ", "mode_cursor" } },
		virt_text_pos = "overlay",
		--
		-- sign_text = " ",
		sign_hl_group = "mode_cursor",
		--
		hl_mode = "blend",
	})
end

-- Set the highlight when entering insert mode.
-- Clear the highlight when leaving insert mode.
-- vim.api.nvim_create_autocmd("ModeChanged", {
-- 	callback = function(event)
-- 		local new_mode = vim.split(event.match, ":")[2]
-- 		if new_mode ~= "i" then
-- 			local buf = vim.api.nvim_get_current_buf()
-- 			restore_cursor()
-- 			vim.api.nvim_buf_clear_namespace(buf, namespace, 0, -1)
-- 		else
-- 			insert_mode_cursor()
-- 		end
-- 	end,
-- })
--
-- -- Add a highlight wherever the cursor when in insert mode.
-- vim.api.nvim_create_autocmd("CursorMovedI", {
-- 	callback = function(event)
-- 		insert_mode_cursor()
-- 	end,
-- })
