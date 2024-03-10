function ColorMyPencils(color)
   vim.g.gruvbox_italic =false 
   vim.g.gruvbox_contrast_dark = "hard"
--   vim.cmd.colorscheme("gruvbox")
    --color = color or "rose-pine"
    --vim.cmd.colorscheme(color)
    --vim.g.gruvbox_baby_function_style = "NONE"
    --vim.g.gruvbox_baby_keyword_style = "NONE"
    --vim.cmd.colorscheme("gruvbox-baby")
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    --vim.cmd([[hi Normal guibg=#000000 ctermbg=234]])
    vim.cmd([[highlight LineNr guifg=#83a598]])
    --vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ColorMyPencils()
