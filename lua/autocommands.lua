local save_yanks = require("save_yanks")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
		print("Yanked")
	end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = save_yanks.save_yank_to_file,
})
