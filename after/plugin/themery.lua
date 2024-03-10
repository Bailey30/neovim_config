require("themery").setup({
	themes = {{
		name = "Gruvbox dark",
		colorscheme = "gruvbox",
		--after = [[ function() vim.cmd.colorscheme("gruvbox") end ]],
	},
	{
		name = "Rose pine",
		colorscheme = "rose-pine",
		--before = [[ function () vim.cmd.colorscheme("rose-pine") end ]],
	},	
    {
		name = "Gruvbox minor",
		colorscheme = "gruvbox-minor",
		--before = [[ function () vim.cmd.colorscheme("rose-pine") end ]],

    }}})
