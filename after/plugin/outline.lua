require("outline").setup({
    outline_window = {
        position = "left",
        auto_jump = true,
    }
    -- preview_window = {
    --     auto_preview = true,
    -- },
    -- symbol_folding = {
    --     autofold_depth = false,
    -- },
})

vim.keymap.set("n", "<leader>ol", "<cmd>Outline<CR>")
