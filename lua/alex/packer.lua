-- Only required if you have  configured as `opt`pack
vim.cmd [[packadd .nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'morhetz/gruvbox'  }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        --config = function()
            --	vim.cmd("colorscheme  rose-pine")-	--end
        })
        --use {"rebelot/kanagawa.nvim", vim.cmd("colorscheme kanagawa-dragon")}

  use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
    use({ 'nvim-treesitter/playground' })
    use("theprimeagen/harpoon")
    use { 'zaldih/themery.nvim' }
     use { 'mbbill/undotree' }
    use { "tpope/vim-fugitive" }

--    use {
--        "williamboman/mason.nvim",
--        "williamboman/mason-lspconfig.nvim",
--        "neovim/nvim-lspconfig",
--    }

--    use {
--        'phpactor/phpactor',
--        config = function()
--            vim.cmd [[autocmd FileType php setlocal makeprg=phpactor]]
--        end,
--        run = 'composer install --no-dev -o'
--    }
--
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
             {'williamboman/mason.nvim'},
             {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        } }

        use { 'echasnovski/mini.nvim' }
        use {
            'nvim-lualine/lualine.nvim',
            --    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }
        use {
            'simonmclean/triptych.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim', -- required
                -- 'nvim-tree/nvim-web-devicons', -- optional
            }
        }
        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended

                "MunifTanjim/nui.nvim",
                -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            }
        }
        use {
            "smjonas/inc-rename.nvim",
            config = function()
                require("inc_rename").setup()
            end,
        }
        use {
            "m4xshen/hardtime.nvim",
            dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
            opts = {}
        }
        use{"jwalton512/vim-blade"}
        --        use{"preservim/nerdtree"}
        --        use{"nvim-tree/nvim-tree.lua"}
        use{"andymass/vim-matchup"}
        use {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        }
        use {"windwp/nvim-ts-autotag"}
        use{'luisiacc/gruvbox-baby'} 
        use{"windwp/nvim-autopairs"}

        use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
        use {'junegunn/fzf.vim'}
        use{"kamykn/spelunker.vim"}
        use {
            "AckslD/nvim-neoclip.lua",
            requires = {
                {'kkharji/sqlite.lua', module = 'sqlite'},
                -- you'll need at least one of these
                -- {'nvim-telescope/telescope.nvim'},
                -- {'ibhagwan/fzf-lua'},
            },
            config = function()
                require('neoclip').setup()
            end,
        }
        use ("ricardoraposo/gruvbox-minor.nvim")
        use({
            "kylechui/nvim-surround",
            tag = "*", -- Use for stability; omit to use `main` branch for the latest features
            config  = function()
                require("nvim-surround").setup({
                    "-- Configuration here, or leave empty to use defaults"
                })
            end
        })
        use {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }
        use {
            "willothy/nvim-cokeline",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "stevearc/resession.nvim"
            },
        }
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }
        use {"lewis6991/gitsigns.nvim"}
        use {"sindrets/diffview.nvim"}
    end)
