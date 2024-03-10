-- local lualine = require("lualine")

-- vim.cmd("lua Lualine()")
-- use :Inpect to get highlight group
vim.keymap.set("n", "<leader>tt", ":Themery<Enter>")
local windowsBlue = "#000080"
local windowsGrey = "#BFBFBF"

function ResetThemes()
    vim.api.nvim_command("runtime plugin/lualine.lua")
    vim.api.nvim_command("runtime plugin/cokeline.lua")
end

require("themery").setup({
    themes = { {
        name = "Gruvbox dark",
        colorscheme = "gruvbox",
            after = [[
        ResetThemes()
        ]],
        --after = [[ function() vim.cmd.colorscheme("gruvbox") end ]],
    },
        {
            name = "Rose pine",
            colorscheme = "rose-pine",
            after = [[
        ResetThemes()
        ]],
            --before = [[ function () vim.cmd.colorscheme("rose-pine") end ]],
        },
        {
            name = "Gruvbox minor",
            colorscheme = "gruvbox-minor",
            after = [[
        ResetThemes()
        ]],
        },
        {
            name = "Mellifluous",
            colorscheme = "mellifluous",
            after = [[
        ResetThemes()
        ]],
        },
        {
            name = "Melange",
            colorscheme = "melange",
            after = [[
            vim.cmd("hi Identifier gui=NONE")
            vim.cmd("hi String gui=NONE")
            vim.cmd("hi Comment gui=NONE")
            vim.cmd("hi Constant gui=NONE")
            vim.cmd("hi @variable gui=NONE")
            vim.cmd("hi @string.special.symbol gui=NONE")
            ResetThemes()
            -- require("cokeline").setup({
                -- default_hl = {
                    --
                    -- }
                    -- })
                    ]]
        },
        {
            name = "Everforest",
            colorscheme = "everforest",
            after = [[vim.api.nvim_command("runtime plugin/lualine.lua")]],
            before = [[  vim.g.everforest_disable_italic_comment = "1" ]]
        }
        , {
        name = "Alduin",
        colorscheme = "alduin",
        after = [[
        ResetThemes()
        ]],
        before = [[

    -- require('cokeline').setup({
    --     default_hl = {
    --     }

    -- require("lualine").setup({})
    ]]
    },
        {
            name = "Hopscotch",
            colorscheme = "hopscotch",
            after = [[
        ResetThemes()
        ]],
        }
        , {
        name = "Despacio",
        colorscheme = "despacio",
        after = [[
        ResetThemes()
        ]],
    },
        -- {
        --     name = "Windows",
        --     colorscheme = "lushtheme1",
        --     after = [[
        --     local windowsWhite = "#FFFFFF"
        --     local windowsBlue = "#000080"
        --     local windowsGrey = "#BFBFBF"
        --     require('cokeline').setup({
        --         default_hl = {
        --             fg = function(buffer)
        --                 return
        --                 buffer.is_focused
        --                 and windowsWhite
        --                 or font
        --             end,
        --             bg = function(buffer)
        --                 return
        --                 buffer.is_focused
        --                 and windowsBlue
        --                 or windowsGrey
        --             end,
        --         }})
        --         ]]
        --     }


    },
})
