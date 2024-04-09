require("nvim-test").setup({
    term = "toggleterm",        -- a terminal to run ("terminal"|"toggleterm")
    termOpts = {
        direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
        width = 96,             -- terminal's width (for vertical|float)
        height = 24,            -- terminal's height (for horizontal|float)
        go_back = false,        -- return focus to original window after executing
        stopinsert = "auto",    -- exit from insert mode (true|false|"auto")
        keep_one = true,        -- keep only one terminal for testing
    },
})
