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
			title = "Yank Yank",
			relative = "editor",
			anchor = "SW",
			style = "minimal",
			border = "rounded",
			footer_pos = "right",
		},
	},
	keymaps = {
		append = { "p" },
		insert = { "P", "<CR>" },
		below = {},
		close = { "<Esc>", "<C-c>", "q" },
		down = "j",
		up = "k",
		yank = "y",
		change_yank_set = "<C-r>",
	},
	cursor = {
		highlights = {
			preserve_position = "YankYankPreserveCursor",
		},
	},
}
function config.setup(options)
	config = vim.tbl_deep_extend("force", config, options or {})
end

return config
