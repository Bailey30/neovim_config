-- Uninstalled
vim.keymap.set("n", "<leader>gr", function()
	Snacks.picker.grep({ layout = { preset = "telescope", backdrop = false } })
end, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "SnacksPicker", { link = "NormalFloat" })
	end,
})

vim.keymap.set("n", "<leader>st", function()
	Snacks.terminal.toggle()
end)
