vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--move highlighted group
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")       --append line below
vim.keymap.set("n", "<C-d>", "<C-d>zz") --these keep cursor in centre when using ctrl d and u to move up and down
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")       -- these keep searched term in center of page when moving to next and previous
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

--vim.keymap.set("n", "<leader>v", "<c-v>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dp]])

-- next greatest remap ever : asbjornhaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<c-c>", "<esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --replace the word you are on
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
--
vim.keymap.set("n", "<leader><leader>", "/")

-- WINDOW PANES
--    vim.keymap.set("n", "ss", ":split<Return>", opts)
--    vim.keymap.set("n", "sv", ":vsplit<Return>", opts)
--    vim. -- Move window
--        vim.keymap.set("n", "sh", "<C-w>h")
--    vim.keymap.set("n", "sk", "<C-w>k")
--  vim.keymap.set("n", "sj", "<C-w>j")
--    vim.keymap.set("n", "sl", "<C-w>l")
--
vim.keymap.set('n', '<A-,>', ':bprev<CR>')
vim.keymap.set('n', '<A-.>', ':bnext<CR>')
vim.keymap.set('n', '<A-q>', ':bd<CR>')

-- split and navigate panes
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- jump to start and end of line
vim.keymap.set("n", "<C-l>", "$")
vim.keymap.set("n", "<C-h>", "_")
-- jump words
vim.keymap.set("n", "<S-h>", "b")
vim.keymap.set("n", "<S-l>", "w")

-- resize windows
vim.keymap.set("n", "<A-0>", ":res +1<enter>")
vim.keymap.set("n", "<A-9>", ":res -1<enter>")
vim.keymap.set("n", "<A-8>", ":vert res +2<enter>")
vim.keymap.set("n", "<A-7>", ":vert res -2<enter>")



vim.api.nvim_create_user_command("PS", "PackerSync", {})

-- Insert mode mapping
vim.api.nvim_set_keymap('n', ':f', ':find <CR>', { noremap = true, silent = true })

-- Visual mode mapping
vim.api.nvim_set_keymap('v', ':f', ':find ', { noremap = true, silent = true })
