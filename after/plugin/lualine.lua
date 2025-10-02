local function get_filetype()
	return vim.bo.filetype
end

local function get_hl(name)
	return vim.api.nvim_get_hl(0, { name = name })
end

local function format(g)
	return "#" .. string.format("%06x", g)
end

local normal = get_hl("Normal")
local constant = get_hl("Constant")
-- local statement = get_hl("Statement")
-- local statement_fg = format(statement.fg)
local normal_fg = format(normal.fg)
local normal_bg = format(normal.bg)
local comment = get_hl("Comment")
local comment_fg = format(comment.fg)
-- local func = get_hl("Function")
-- local function_fg = format(func.fg)
-- local comment = get_hl("Comment")
-- local comment_fg = format(comment.fg)
local string = get_hl("String")
-- local string_fg = string.fg and format(string.fg) or format(constant.fg)
local special = get_hl("Special")
-- local special_fg = format(special.fg)
local identifier = get_hl("Identifier")
-- local identifier_fg = format(identifier.fg)
local termCursorNC = get_hl("PmenuThumb")
-- local pmenuThumb_bg = format(termCursorNC.bg)
local statusLineNC = get_hl("StatusLineNC")
-- local statusLine_bg = statusLineNC.bg and format(statusLineNC.bg) or normal_bg
local statusLine_bg = normal_bg
local cursorLine = get_hl("CursorLine")
local cursorLine_bg = format(cursorLine.bg)
-- print(cursorLine_bg)
-- print(normal_fg)

-- local col = vim.api.nvim_get_hl(0,{name = "Search"})
-- local search_bg = string.format("%06x", col.bg)

local pink = "#D3869B"

local orange = "#FE8112"
local command_green = "#B8BB26"

local function getTheme()
	local custom_gruvbox = require("lualine.themes.gruvbox")
	-- change the background of lualine_c section for normal moe
	-- insert
	custom_gruvbox.insert.a.fg = normal_fg
	custom_gruvbox.insert.a.bg = normal_bg

	custom_gruvbox.insert.b.fg = normal_fg
	custom_gruvbox.insert.b.bg = normal_bg

	custom_gruvbox.insert.c.fg = normal_fg
	custom_gruvbox.insert.c.bg = normal_bg

	-- visual
	custom_gruvbox.visual.a.fg = normal_fg
	custom_gruvbox.visual.a.bg = normal_bg

	custom_gruvbox.visual.b.fg = normal_fg
	custom_gruvbox.visual.b.bg = normal_bg

	custom_gruvbox.visual.c.fg = normal_fg
	custom_gruvbox.visual.c.bg = normal_bg

	-- command
	custom_gruvbox.command.a.fg = normal_fg
	custom_gruvbox.command.a.bg = normal_bg

	custom_gruvbox.command.b.fg = normal_fg
	custom_gruvbox.command.b.bg = normal_bg

	custom_gruvbox.command.c.fg = normal_fg
	custom_gruvbox.command.c.bg = normal_bg

	-- normal
	custom_gruvbox.normal.a.fg = normal_fg
	custom_gruvbox.normal.a.bg = normal_bg

	custom_gruvbox.normal.b.fg = normal_fg
	custom_gruvbox.normal.b.bg = normal_bg

	custom_gruvbox.normal.c.fg = normal_fg
	custom_gruvbox.normal.c.bg = normal_bg

	return custom_gruvbox
end

local function lsp()
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	if #clients > 0 then
		local lsp_names = {}
		for _, client in ipairs(clients) do
			table.insert(lsp_names, client.name)
		end
		-- return ":" .. table.concat(lsp_names, "|")
		return "  " .. table.concat(lsp_names, "|")
	else
		return ""
	end
end

local function mode()
	local mode = vim.api.nvim_get_mode().mode

	local dict = {
		i = "insert",
		c = "command",
		n = "normal",
		v = "visual",
		["\22"] = "visual block", -- CRTL+Q to enter
	}
	-- return vim.fn.toupper(dict[mode])
	-- return vim.fn.toupper(dict[mode]:sub(1, 1))
	-- return dict[mode]:sub(1, 1)
	return dict[tostring(mode)]
end

local config = {
	options = {
		theme = getTheme(),
		component_separators = "",
		section_separators = "",
		globalstatus = true,
	},
	sections = {
		lualine_a = { { mode } },

		lualine_b = {},
		lualine_c = {
			{
				"branch",
				icon = "",
				padding = {
					left = 0,
					right = 0,
				},
				fmt = function(branch, ctx)
					if branch == "" then
						return ""
					end
					-- return "" .. str .. ":"
					return "" .. branch .. " "
				end,
				separator = "",
			},
			{
				"diff",
			},
			{
				"filename",
				path = 3,
				fmt = function(str, ctx)
					return str
				end,
				shorting_target = 70,
				padding = { left = 1, right = 1 },
			},
		},

		lualine_x = { "" },
		lualine_y = {},
		lualine_z = {
			{
				get_filetype,
				fmt = function(str, ctx)
					return str
				end,
				padding = { left = 1, right = 0 },
			},
			{

				lsp,
				padding = { left = 0, right = 1 },
			},
			{
				"location",
				fmt = function(str, ctx)
					local line = vim.fn.line(".")
					local col = vim.fn.col(".")
					local total_lines = vim.fn.line("$")
					-- return line .. ":" .. col .. "/" .. total_lines
					return "col " .. col .. " line " .. line .. " of " .. total_lines
					-- return "col " .. col .. ", line " .. line .. " of " .. total_lines
				end,
			},
		},
	},
}

require("lualine").setup(config)

vim.cmd("command! Lualine runtime plugin/lualine.lua")
