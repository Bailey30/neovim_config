local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>C-p", builtin.git_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- vim.keymap.set("n", "<C-j>", builtin.buffers, {})
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pp", builtin.live_grep, {})
vim.keymap.set(
	"n",
	"<leader>bb",
	":lua require'telescope'.extensions.file_browser.file_browser((require('telescope.themes').get_ivy({ layout_config = {height= 100} })))<CR>"
)

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
	},
	pickers = {
		live_grep = {
			layout_config = {
				horizontal = {
					preview_cutoff = 0,
				},
			},
		},
	},
	extensions = {
		file_browser = {
			layout_config = {
				height = 100,
				horizontal = {
					preview_cutoff = 0,
				},
			},
			-- theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
					["C-j"] = "move_selection_next",
					["C-k"] = "move_selection_previous",
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

require("telescope").load_extension("live_grep_args")
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
