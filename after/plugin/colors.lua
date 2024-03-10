function ColorMyPencils(color)
    vim.g.gruvbox_italic = false
    vim.g.gruvbox_contrast_dark = "soft"
    -- vim.cmd.colorscheme("gruvbox-minor")
    -- vim.cmd.colorscheme("gruvbox")
    -- vim.cmd.colorscheme("alduin")
    -- vim.cmd.colorscheme("lushtheme1")
    -- vim.cmd.colorscheme("everforest")
    -- vim.cmd('colorscheme mellifluous')
    vim.cmd('colorscheme hopscotch')
    --color = color or "rose-pine"
    --vim.cmd.colorscheme(color)
    --vim.g.gruvbox_baby_function_style = "NONE"
    --vim.g.gruvbox_baby_keyword_style = "NONE"
    --
    --vim.cmd.colorscheme("gruvbox-baby")
    -- highlights line where cursor is
    vim.cmd("set cursorline")

    -- color of sidebar next to numbers
    -- vim.cmd("highlight SignColumn guibg=#282828") -- gruvbox medium
    vim.cmd("highlight SignColumn guibg=#1D2021") -- gruvbox hard
    --
    -- removes background
    -- vim.api.nvim_set_hl(0, "normal", {bg = "none"})
    -- vim.cmd([[hi normal guibg=#141414 ctermbg=234]])
    --
    -- line number colours
    -- vim.cmd([[highlight linenr guifg=#83a598]])
    --vim.api.nvim_set_hl(0, "normalfloat", {bg = "none"})

    --colors for mode change bars
    vim.cmd('hi PinkLine guibg=#DD3869 guifg=#DD3869')
    vim.cmd('hi GreenLine guibg=#B8BB26 guifg=#B8BB26')
    vim.cmd('hi OrangeLine guibg=#FE8112 guifg=#FE8112')
end

ColorMyPencils()
