local config = {
	hints = {
		-- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
		---@type string
		dictionary = "sadftewcmrguio",
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
	keymaps = {
		put = { "p", "<CR>" },
		close = { "<Esc>", "<C-c>", "q" },
		down = "j",
		up = "k",
		yank = "y",
		change_yank_set = "<C-r>",
	},
}

return config
