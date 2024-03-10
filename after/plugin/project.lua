--require('telescope').load_extension('projects')
--require'telescope'.extensions.projects.projects{}
vim.keymap.set("n", "<leader>fp", ":Telescope projects<Enter>")
