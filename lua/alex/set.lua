vim.opt.guicursor = ""
--vim.opt.guifont = "FiraCode Nerd Font Mono"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "C:/Users/Baile/AppData/Local/nvim-data/undo"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.cmd(":setlocal spell spelllang=en_us")
-- vim.opt.spelllang = 'en_us'
--vim.opt.colorcolumn = "80"
vim.lsp.set_log_level("debug")

-- format on save
-- vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format()")
vim.cmd("autocmd BufWritePre * lua vim.cmd('Neoformat')")


local a = vim.api

a.nvim_create_autocmd("UIEnter", {
    group = a.nvim_create_augroup("set_terminal_bg", {}),
    callback = function()
        local bg = a.nvim_get_hl_by_name("Normal", true)["background"]
        if not bg then
            return
        end

        local fmt = string.format

        if os.getenv("TMUX") then
            bg = fmt('printf "\\ePtmux;\\e\\033]11;#%06x\\007\\e\\\\"', bg)
        else
            bg = fmt('printf "\\033]11;#%06x\\007"', bg)
        end

        os.execute(bg)
        return true
    end,
})

vim.api.nvim_set_option("clipboard", "unnamed")
