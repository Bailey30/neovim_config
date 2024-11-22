require("diffview").setup()


vim.keymap.set('n', '<leader>dvo', ":DiffviewOpen<Enter>")
vim.keymap.set('n', '<leader>dvc', ":DiffviewClose<Enter>")
