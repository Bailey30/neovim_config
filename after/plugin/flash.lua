require("flash").setup {
    search = {
        mode = "exact",
    },
    keys = {
        { "m", mode = { "n" }, function()
            require("flash").jump({
                pattern = vim.fn.expand("<cword>"),
            })
        end
        }
    } }
require("flash").toggle(true)
