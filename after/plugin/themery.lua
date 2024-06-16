-- local lualine = require("lualine")

-- vim.cmd("lua Lualine()")
-- use :Inpect to get highlight group
vim.keymap.set("n", "<leader>tt", ":Themery<Enter>")
local windowsBlue = "#000080"
local windowsGrey = "#BFBFBF"

function ResetThemes()
    vim.api.nvim_command("runtime plugin/lualine.lua")
    vim.api.nvim_command("runtime plugin/cokeline.lua")
    vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { link = "CursorLine" })

    -- remove all italics
    local hl_groups = vim.api.nvim_get_hl(0, {})

    for key, hl_group in pairs(hl_groups) do
        if hl_group.italic then
            vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, { italic = false }))
        end
    end
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
            -- vim.cmd('hi Normal guibg=black')
        ResetThemes()
        ]],
            before = [[
            require("rose-pine").setup({
                variant = "moon",
                styles = {
                    italic = false
                },
                highlight_groups = {
		StatusLine = { fg = "pine", bg = "pine", blend = 10 },
		StatusLineNC = { fg = "subtle", bg = "surface" },
        -- CursorLine = { fg = "rose", bg = "rose", blend = 10}
	},
            })
            ]],
        },
        {
            name = "Rosebones",
            colorscheme = "rosebones",
            after = [[
        ResetThemes()
        ]],
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
        -- {
        --     name = "Melange",
        --     colorscheme = "melange",
        --     after = [[
        --     vim.cmd("hi Identifier gui=NONE")
        --     vim.cmd("hi String gui=NONE")
        --     vim.cmd("hi Comment gui=NONE")
        --     vim.cmd("hi Constant gui=NONE")
        --     vim.cmd("hi @variable gui=NONE")
        --     vim.cmd("hi @string.special.symbol gui=NONE")
        --     ResetThemes()
        --     -- require("cokeline").setup({
        --         -- default_hl = {
        --             --
        --             -- }
        --             -- })
        --             ]]
        -- },
        -- {
        --     name = "Everforest",
        --     colorscheme = "everforest",
        --     after = [[vim.api.nvim_command("runtime plugin/lualine.lua")]],
        --     before = [[  vim.g.everforest_disable_italic_comment = "1" ]]
        -- },
        {
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
        },
        -- {
        --     name = "Despacio",
        --     colorscheme = "despacio",
        --     after = [[
        -- ResetThemes()
        -- ]]
        -- },
        -- {
        --     name = "Tundra",
        --     colorscheme = "tundra",
        --     after = [[
        --     ResetThemes()
        --     ]]
        -- },
        {
            name = "Bamboo",
            colorscheme = "bamboo",
            after = [[
        ResetThemes()
        ]]
        },
        {
            name = "Zenbones",
            colorscheme = "zenbones",
            after = [[
        ResetThemes()
            vim.cmd("hi String gui=NONE")
            vim.cmd("hi Constant gui=NONE")
            vim.cmd("hi Number gui=NONE")
        ]]
        },
        {
            name = "Zenwritten",
            colorscheme = "zenwritten",
            after = [[
        ResetThemes()
            vim.cmd("hi String gui=NONE")
            vim.cmd("hi Constant gui=NONE")
            vim.cmd("hi Number gui=NONE")
        ]]
        },
        {
            name = "Plain",
            colorscheme = "plain",
            after = [[
            vim.cmd("hi Normal guibg=#222222")
        ResetThemes()
        ]]
        },
        {
            name = "Biscuit",
            colorscheme = "biscuit",
            before = [[
            ]],
            after = [[
        ResetThemes()
        ]]
        },
        {
            name = "Aylin",
            colorscheme = "aylin",
            after = [[
        ResetThemes()
        ]]
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
