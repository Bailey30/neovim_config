local get_hex = require('cokeline.hlgroups').get_hl_attr

local function format(g)
    return "#" .. string.format("%06x", g)
end

local green = vim.g.terminal_color_2
local yellow = vim.g.terminal_color_3
local background = "#282828"
-- local background = "#1D2021"
local coral = "#ff7f50"
local foreground = "#3c3836"
local font = "#AC9D87"
local hlFont = "#fe8619"
local windowsBlue = "#000080"
local windowsGrey = "#BFBFBF"

local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
local statusLineNC = vim.api.nvim_get_hl(0, { name = "cursorLine" })

local normal_bg = format(normal.bg)
local statusLine_bg = statusLineNC.bg and format(statusLineNC.bg) or nil
require('cokeline').setup({

    default_hl = {
        --  fg = function(buffer)
        --    return
        --      buffer.is_focused
        --  and font
        --       or font
        --  end,
        bg = function(buffer)
            return
                buffer.is_focused
                and normal_bg
                or statusLine_bg
        end,
    },

    components = {
        {
            text = ' ',
            fg = function(buffer)
                return
                    buffer.is_modified and yellow or green
            end
        },
        {
            text = function(buffer) return buffer.index .. ': ' end,
        },
        {
            text = function(buffer) return ' ' end,
            fg = function(buffer) return buffer.devicon.color end,
        },
        {
            text = function(buffer) return '' end,
        },
        {
            text = function(buffer) return buffer.unique_prefix end,
            -- fg = get_hex('Comment', 'fg'),
            -- italic = true,
        },
        {
            text = function(buffer)
                return buffer.filename
            end,
            fg = function(buffer)
                if (buffer.diagnostics.errors > 0) then
                    return '#C95157'
                end
                if buffer.is_modified then
                    return hlFont
                end
            end,
            style = function(buffer)
                if buffer.is_focused then
                    underline = true
                end
                return nil
            end,
            -- underline = function(buffer)
            --     if buffer.is_focused then
            --         return true
            --     end
            -- end,
            bold = function(buffer)
                if buffer.is_focused then
                    return true
                end
            end
        },
        {
            text = ' ',
        },
    },
})
