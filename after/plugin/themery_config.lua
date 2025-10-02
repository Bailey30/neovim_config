-- local lualine = require("lualine")
local background = require("bg")

-- vim.cmd("lua Lualine()")
-- use :Inpect to get highlight group

local function get_hl(name)
	return vim.api.nvim_get_hl(0, { name = name })
end

local function format(g)
	return "#" .. string.format("%06x", g)
end

vim.keymap.set("n", "<leader>tt", ":Themery<Enter>")

function AlterColours()
	-- Overwrite some colours.
	-- Known altered schemes: hopscotch
	vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
	vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
	-- CursorLine highlight in blink-cmp completion popup
	vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine", { link = "CursorLine" })
end

function ResetThemes()
	vim.api.nvim_command("runtime plugin/lualine.lua")
	vim.api.nvim_command("runtime plugin/cokeline.lua")
	vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { link = "CursorLine" })

	local normal = get_hl("Normal")
	local normal_bg = format(normal.bg)

	-- changes the terminal background to remove the blank line around the edge.
	-- defined in lua/bg.lua
	background.change_background(normal_bg)

	-- remove all italics
	local hl_groups = vim.api.nvim_get_hl(0, {})

	for key, hl_group in pairs(hl_groups) do
		if hl_group.italic then
			vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, { italic = false }))
		end
	end

	local cursor_colour = vim.api.nvim_get_hl(0, { name = "Search" })
	-- local cursor_colour = get_hl("Normal")
	-- local cursor_colour_bg = format(cursor_colour.bg)

	vim.api.nvim_set_hl(0, "mode_cursor", { nocombine = true, blend = 50, bg = cursor_colour.bg })
end

require("themery").setup({
	themes = {
		{
			name = "Github Dark Dimmed",
			colorscheme = "github_dark_dimmed",
			after = [[
                ResetThemes()
            ]],
		},
		-- {
		--     name = "Gruvbox dark",
		--     colorscheme = "gruvbox",
		--     after = [[
		-- ResetThemes()
		-- ]],
		--     --after = [[ function() vim.cmd.colorscheme("gruvbox") end ]],
		-- },
		{
			name = "Gruvbox",
			colorscheme = "gruvbox",
			after = [[
            ResetThemes()
            ]],
		},
		{
			name = "Darcubox",
			colorscheme = "darcubox",
			after = [[
			         ResetThemes()
			         ]],
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
			name = "Jellybeans",
			colorscheme = "jellybeans",
			after = [[
            ResetThemes()
            AlterColours()
            ]],
		},
		-- {
		-- 	name = "Palenight",
		-- 	colorscheme = "palenight",
		-- 	after = [[
		--           ResetThemes()
		--           ]],
		-- },

		{
			name = "Gruvbox minor",
			colorscheme = "gruvbox-minor",
			after = [[
        ResetThemes()
        ]],
		},
		-- {
		-- 	name = "Mellifluous",
		-- 	colorscheme = "mellifluous",
		-- 	after = [[
		--       ResetThemes()
		--       ]],
		-- },
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
		-- {
		-- 	name = "Alduin",
		-- 	colorscheme = "alduin",
		-- 	after = [[
		--       ResetThemes()
		--       ]],

		{
			name = "Hopscotch",
			colorscheme = "hopscotch",
			after = [[
        ResetThemes()
        AlterColours()
        ]],
		},
		{
			name = "One dark",
			colorscheme = "onedark",
			after = [[
        ResetThemes()
        ]],
		},
		{
			name = "Vague",
			colorscheme = "vague",
			after = [[ResetThemes()]],
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
		-- {
		--     name = "Bamboo",
		--     colorscheme = "bamboo",
		--     after = [[
		-- ResetThemes()
		-- ]]
		-- },
		{
			name = "Catppuccin",
			colorscheme = "catppuccin",
			after = [[
            ResetThemes()
            ]],
		},

		{
			name = "Synthweave",
			colorscheme = "synthweave",
			after = [[
            ResetThemes()
            ]],
		},
		{
			name = "Old World",
			colorscheme = "oldworld",
			after = [[
            ResetThemes()
            ]],
		},
		-- {
		--     name = "Zenbones",
		--     colorscheme = "zenbones",
		--     after = [[
		-- ResetThemes()
		--     vim.cmd("hi String gui=NONE")
		--     vim.cmd("hi Constant gui=NONE")
		--     vim.cmd("hi Number gui=NONE")
		-- ]]
		-- },
		-- {
		--     name = "Zenwritten",
		--     colorscheme = "zenwritten",
		--     after = [[
		-- ResetThemes()
		--     vim.cmd("hi String gui=NONE")
		--     vim.cmd("hi Constant gui=NONE")
		--     vim.cmd("hi Number gui=NONE")
		-- ]]
		-- },
		-- {
		--     name = "Plain",
		--     colorscheme = "plain",
		--     after = [[
		--     vim.cmd("hi Normal guibg=#222222")
		-- ResetThemes()
		-- ]]
		-- },
		{
			name = "Emperor",
			colorscheme = "emperor-alt",
			after = [[
            ResetThemes()
            	
            vim.api.nvim_set_hl(0, "@variable", { link = "@variable.parameter" })
            ]],
		},
		{
			name = "Thyrging",
			colorscheme = "thyrfing-alt",
			after = [[ResetThemes()]],
		},
		{
			name = "Windir",
			colorscheme = "windir-alt",
			after = [[ResetThemes()]],
		},
		{
			name = "Impaled Nazarene",
			colorscheme = "impaled-nazarene-alt",
			after = [[ResetThemes()]],
		},
		-- {
		--     name = "Biscuit",
		--     colorscheme = "biscuit",
		--     before = [[
		--     ]],
		--     after = [[
		--     ResetThemes()
		--     ]],
		-- },
		-- {
		--     name = "Aylin",
		--     colorscheme = "aylin",
		--     after = [[
		--     ResetThemes()
		--     ]],
		-- },
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
