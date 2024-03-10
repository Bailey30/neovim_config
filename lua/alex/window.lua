-- local buf, win
--
-- local function open_window()
--   buf = api.nvim_create_buf(false, true) -- create new emtpy buffer
--
--   api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
--
--   -- get dimensions
--   local width = api.nvim_get_option("columns")
--   local height = api.nvim_get_option("lines")
--
--   -- calculate our floating window size
--   local win_height = math.ceil(height * 0.8 - 4)
--   local win_width = math.ceil(width * 0.8)
--
--   -- and its starting position
--   local row = math.ceil((height - win_height) / 2 - 1)
--   local col = math.ceil((width - win_width) / 2)
--
--   -- set some options
--   local opts = {
--     style = "minimal",
--     -- relative = "editor",
--     width = win_width,
--     height = win_height,
--     row = row,
--     col = col,
--     focusable= false,
--     external = true
--   }
--
--   -- and finally create it with buffer attached
--   win = api.nvim_open_win(buf, true, opts)
-- end
--
-- local function close_buffer()
--  api.nvim_close_win(buf, true)
-- end
--
--
--
--
-- local Popup = require("nui.popup")
-- vim.cmd('hi ActiveWindow guibg=#17252c')

-- highlight! Orange guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
-- local popup = Popup({
--   position = {
--   row = 1,
--   col = 20,
-- },
--   size = {
--     width = 100,
--     height = height ,
--   },
--   enter = false,
--   focusable = false,
--   zindex = 50,
--   relative = "win",
--   border = {
--     -- padding = {
--     --   top = 2,
--     --   bottom = 2,
--     --   left = 3,
--     --   right = 3,
-- -- },
--     style = "rounded",
--     -- text = {
--       -- top = " ",
--       -- top_align = "cr",
--       -- bottom = "I am bottom title",
--       -- bottom_align = "left",
--     -- },
--   },
--   buf_options = {
--     modifiable = true,
--     readonly = true,
--   },
--   win_options = {
--     winblend = 1,
--     winhighlight = "Normal:GreenLine,FloatBorder:GreenLine",
--   },
-- })
--
-- -- Create autocmd to open the buffer when entering command mode
-- vim.api.nvim_create_autocmd("CmdlineEnter",  {
--     pattern = "*",
--     callback = function()
--         -- open_window()
--         popup:mount()
--         -- popup:show()
--         vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { "Hello World" })
--     end
-- })
--
-- vim.api.nvim_create_autocmd("CmdlineLeave",  {
--     pattern = "*",
--     callback =  function()
--         -- close_buffer()
--         print("leave")
--         popup:hide()
--         popup:unmount()
--     end
-- })
--
--
local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local api = vim.api
local width = api.nvim_get_option("columns")
local height = api.nvim_get_option("lines")
local green = '#D3869B'

local greenLeft = Popup({
    enter = false,
    focusable = false,
    buf_options = {
        modifiable = true,
        readonly = false,
    },
    border = {
        style = "none",
    },
    position = {
        row = 0,
        col = 2,
    },
    size = {
        width = 1,
        height = height - 2,
    },
    win_options = {
        winhighlight = "Normal:GreenLine,FloatBorder:GreenLine",
    },
    padding = {
        top = 0,
        bottom = 0,
        left = 0,
        right = 0,
    },
    style = "none",
})

-- mount/open the component
-- popup:mount()
-- greenLeft:show()
-- unmount component when cursor leaves buffer
-- popup:on(event.BufLeave, function()
-- popup:unmount()
-- end)

-- set content

vim.api.nvim_buf_set_lines(greenLeft.bufnr, 0, 1, true, { "COMMAND" })

vim.api.nvim_create_autocmd("CmdlineEnter", {
    callback = function()
        -- greenLeft:show()
    end
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
       -- greenLeft:hide()
        -- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, true, { "COMMAND" })
    end
})
