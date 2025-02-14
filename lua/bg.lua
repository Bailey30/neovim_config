local M = {}

-- Change the background color of the terminal Neovim is running in.
function M.change_background(color)
    io.write("\27]11;" .. color .. "\7")
    io.flush()
end

vim.api.nvim_create_user_command("SetTerminalBG", function(opts)
    M.change_background(opts.args)
end, { nargs = 1 })

return M
