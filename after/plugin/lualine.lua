-- function extract_color_from_hllist(scope, syntaxlist, default)
--
--   scope = type(scope) == 'string' and { scope } or scope
--   for _, highlight_name in ipairs(syntaxlist) do
--     if vim.fn.hlexists(highlight_name) ~= 0 then
--       local color = extract_highlight_colors(highlight_name)
--       for _, sc in ipairs(scope) do
--         if color.reverse then
--           if sc == 'bg' then
--             sc = 'fg'
--           else
--             sc = 'bg'
--           end
--         end
--         if color[sc] then
--           return color[sc]
--         end
--       end
--     end
--   end
--   return default
-- end
--
-- -- local col = extract_highlight_colors("String")
-- -- print("col", string.format('#%06x', col.foreground))
--
--
-- -- print("col", string.format("%06x", col.bg))
-- -- print("serchbg", search_bg)
--
--
-- function extract_highlight_colors(color_group, scope)
--   local color = require('lualine.highlight').get_lualine_hl(color_group)
--   -- print("color", color)
--   if not color then
--     if vim.fn.hlexists(color_group) == 0 then
--       return nil
--     end
--     color = vim.api.nvim_get_hl_by_name(color_group, true)
--     if color.background ~= nil then
--       color.bg = string.format('#%06x', color.background)
--       color.background = nil
--     end
--     if color.foreground ~= nil then
--       color.fg = string.format('#%06x', color.foreground)
--       color.foreground = nil
--     end
--     if color.special ~= nil then
--       color.sp = string.format('#%06x', color.special)
--       color.special = nil
--     end
--   end
--   if scope then
--     return color[scope]
--   end
--   return color
-- end
local function get_current_file_location()
    -- Get the buffer number of the current buffer
    local current_buffer = vim.fn.bufnr('%')

    -- Get the file name associated with the current buffer
    local file_name = vim.fn.bufname(current_buffer)

    -- Get the full path of the file
    local full_path = vim.fn.fnamemodify(file_name, ':p')

    -- Get the project's root directory
    local project_root = vim.fn.getcwd()

    -- Make the path relative to the project root
    local relative_path = vim.fn.fnamemodify(full_path, ':~:' .. project_root)

    return relative_path
end

local function get_hl(name)
    return vim.api.nvim_get_hl(0, { name = name })
end

local function format(g)
    return "#" .. string.format("%06x", g)
end

local normal = get_hl("Normal")
local constant = get_hl("Constant")
local normal_fg = format(normal.fg)
local normal_bg = format(normal.bg)
local string = get_hl("String")
local string_fg = string.fg and format(string.fg) or format(constant.fg)
local special = get_hl("Special")
local special_fg = format(special.fg)
local identifier = get_hl("Identifier")
-- local identifier_fg = format(identifier.fg)
-- local termCursorNC = get_hl("PmenuThumb")
-- local pmenuThumb_bg = format(termCursorNC.bg)
local statusLineNC = get_hl("StatusLineNC")
-- local statusLine_bg = statusLineNC.bg and format(statusLineNC.bg) or normal_bg
local statusLine_bg = normal_bg
-- local cursorLine = get_hl("CursorLine")
-- local cursorLine_bg = format(cursorLine.fg)
-- print(cursorLine_bg)
-- print(normal_fg)


-- local col = vim.api.nvim_get_hl(0,{name = "Search"})
-- local search_bg = string.format("%06x", col.bg)

local pink = '#D3869B'

local orange = '#FE8112'
local command_green = '#B8BB26'

local function getTheme()
    local custom_gruvbox = require 'lualine.themes.gruvbox'
    -- change the background of lualine_c section for normal moe
    -- insert
    custom_gruvbox.insert.a.fg = normal_bg
    custom_gruvbox.insert.a.bg = '#D3869B'

    custom_gruvbox.insert.b.fg = normal_fg
    custom_gruvbox.insert.b.bg = statusLine_bg

    custom_gruvbox.insert.c.fg = normal_bg
    custom_gruvbox.insert.c.bg = '#D3869B'

    -- visual
    custom_gruvbox.visual.a.fg = normal_bg
    custom_gruvbox.visual.a.bg = orange

    custom_gruvbox.visual.b.fg = normal_fg
    custom_gruvbox.visual.b.bg = statusLine_bg

    custom_gruvbox.visual.c.fg = normal_bg
    custom_gruvbox.visual.c.bg = orange

    -- comman
    custom_gruvbox.command.a.fg = normal_bg
    custom_gruvbox.command.a.bg = command_green

    custom_gruvbox.command.b.fg = normal_fg
    custom_gruvbox.command.b.bg = statusLine_bg

    custom_gruvbox.command.c.fg = normal_bg
    custom_gruvbox.command.c.bg = command_green

    -- normal
    custom_gruvbox.normal.a.fg = normal_bg
    custom_gruvbox.normal.a.bg = normal_fg

    custom_gruvbox.normal.b.fg = normal_fg
    custom_gruvbox.normal.b.bg = statusLine_bg

    custom_gruvbox.normal.c.fg = normal_fg
    custom_gruvbox.normal.c.bg = normal_bg

    return custom_gruvbox
end

local config = {
    options = {
        theme = getTheme(),
        component_separators = "|",
        section_separators = "",
    },
    sections = {
        lualine_c = {
            {
                -- get_current_file_location
                "filename",
                path = 1
            }
        },
        lualine_b = {
            {
                'diff',
                -- colored = true,
                -- color = "normal_bg",
                diff_color = {
                    -- Same color values as the general color option can be used here.
                    added    = 'GreenFg',  -- Changes the diff's added color
                    modified = 'OrangeFg', -- Changes the diff's modified color
                    removed  = 'PinkFg',   -- Changes the diff's removed color you
                },
            }, {
            "branch"
        }, {
            "diagnostics"
        }
        },
        lualine_x = { "" },
        lualine_y = { "ctime", "cdate", "filetype", "progress" }
    },
}



-- require('lualine').setup(config)


vim.cmd("command! Lualine runtime plugin/lualine.lua")


-- code taken from the repo to construct the theme
-- local colors = {
--   normal  = extract_color_from_hllist('bg', { 'PmenuSel', 'PmenuThumb', 'TabLineSel' }, '#000000'),
--   insert  = extract_color_from_hllist('fg', { 'String', 'MoreMsg' }, '#000000'),
--   replace = extract_color_from_hllist('fg', { 'Number', 'Type' }, '#000000'),
--   visual  = extract_color_from_hllist('fg', { 'Special', 'Boolean', 'Constant' }, '#000000'),
--   command = extract_color_from_hllist('fg', { 'Identifier' }, '#000000'),
--   back1   = extract_color_from_hllist('bg', { 'Normal', 'StatusLineNC' }, '#000000'),
--   fore    = extract_color_from_hllist('fg', { 'Normal', 'StatusLine' }, '#000000'),
--   back2   = extract_color_from_hllist('bg', { 'StatusLine' }, '#000000'),
-- }
--
-- local theme = {
--   normal = {
--     a = { bg = colors.normal, fg = colors.back1, gui = 'bold' },
--     b = { bg = colors.back1, fg = colors.normal },
--     c = { bg = colors.back2, fg = colors.fore },
--   },
--   insert = {
--     a = { bg = colors.insert, fg = colors.back1, gui = 'bold' },
--     b = { bg = colors.back1, fg = colors.insert },
--     c = { bg = colors.back2, fg = colors.fore },
--   },
--   replace = {
--     a = { bg = colors.replace, fg = colors.back1, gui = 'bold' },
--     b = { bg = colors.back1, fg = colors.replace },
--     c = { bg = colors.back2, fg = colors.fore },
--   },
--   visual = {
--     a = { bg = colors.visual, fg = colors.back1, gui = 'bold' },
--     b = { bg = colors.back1, fg = colors.visual },
--     c = { bg = colors.back2, fg = colors.fore },
--   },
--   command = {
--     a = { bg = colors.command, fg = colors.back1, gui = 'bold' },
--     b = { bg = colors.back1, fg = colors.command },
--     c = { bg = colors.back2, fg = colors.fore },
--   },
-- }
--
-- return {Lualine = Lualine}
