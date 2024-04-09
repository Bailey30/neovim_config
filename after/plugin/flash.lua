require("flash").setup {
    search = {
        mode = "fuzzy",
    },
    keys = {
        { "m", mode = { "n" }, function()
            require("flash").jump({
                pattern = vim.fn.expand("<cword>"),
            })
        end
        }
    } }
