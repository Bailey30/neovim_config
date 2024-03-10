require("telescope").setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                    ["C-j"] = "move_selection_next",
                    ["C-k"]= "move_selection_previous",
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
}


