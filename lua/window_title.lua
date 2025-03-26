-- Function to change the terminal window title
function ChangeWindowTitle(title)
	io.write("\27]2;" .. title .. "\7")
	io.flush()
end

-- Function to update the title based on the active buffer
function UpdateWindowTitle()
	local bufname = vim.api.nvim_buf_get_name(0) -- Get current buffer name
	if bufname == "" then
		bufname = "[No Name]" -- Default for unnamed buffers
	else
		bufname = vim.fn.fnamemodify(bufname, ":t") -- Get only the filename
	end
	ChangeWindowTitle(bufname) -- Set terminal title
end

-- Auto-update the title on buffer switch
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	callback = UpdateWindowTitle,
})

-- Set initial title on startup
UpdateWindowTitle()
