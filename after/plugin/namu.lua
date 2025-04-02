require("namu").setup({
	namu_symbols = {
		enable = true,
		options = {
			row_position = "top10_right",
			movement = {
				next = { "<C-j>" },
				previous = { "<C-k>" },
				close = { "<ESC>", "<C-c>" },
			},
			display = {
				mode = "icon",
				padding = 1,
			},
			window = {
				padding = 8,
			},
			AllowKinds = {
				default = {
					"Function",
					"Method",
					"Class",
					"Module",
					"Property",
					"Variable",
					"Constant",
					-- "Enum",
					-- "Interface",
					-- "Field",
					-- "Struct",
				},
			},
		}, -- here you can configure namu
	},
	-- Optional: Enable other modules if needed
	ui_select = { enable = false }, -- vim.ui.select() wrapper
	colorscheme = {
		enable = false,
		options = {
			-- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
			persist = true, -- very efficient mechanism to Remember selected colorscheme
			write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
		},
	},
})

vim.keymap.set("n", "<leader>nm", ":Namu symbols<cr>", {
	desc = "Jump to LSP symbol",
	silent = true,
})
