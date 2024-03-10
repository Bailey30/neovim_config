require("scrollbar").setup({
    handle = {
        text= " "
    },
    marks = {
         Cursor = {
           text = " ",
            priority = 0,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "CursorColumn",
        },
    }
})
