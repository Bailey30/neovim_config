-- Only required if you have  configured as `opt`pack
vim.cmd([[packadd .nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- THEMES
	-- use { 'morhetz/gruvbox' }
	use({ "ellisonleao/gruvbox.nvim" })
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		--config = function()
		--	vim.cmd("colorscheme  rose-pine")-	--end
	})
	-- use { 'luisiacc/gruvbox-baby' }
	use("ricardoraposo/gruvbox-minor.nvim")
	use({ "sainnhe/everforest" })
	use({
		"ramojus/mellifluous.nvim",
		-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
		config = function()
			-- optional, see configuration section.
		end,
	})
	use({ "savq/melange-nvim" })
	use({ "metalelf0/base16-black-metal-scheme" })
	use("Yazeed1s/oh-lucy.nvim")
	use({ "sam4llis/nvim-tundra" })
	use({ "aktersnurra/no-clown-fiesta.nvim" })
	use({ "mcchrish/zenbones.nvim" })
	use({ "andreypopp/vim-colors-plain" })
	use({ "ribru17/bamboo.nvim" })
	use({ "Biscuit-Colorscheme/nvim" })
	use({ "AhmedAbdulrahman/vim-aylin" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("navarasu/onedark.nvim")
	use({ "projekt0n/github-nvim-theme" })
	use({ "dgox16/oldworld.nvim" })
	use({ "metalelf0/jellybeans-nvim" })
	use({ "samharju/synthweave.nvim" })
	use({ "alexmozaidze/palenight.nvim" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" } },
		dependecies = {
			"nvim-telescope/telescope-file-browser.nvim",
		},
	})

	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
	-- use({ 'nvim-treesitter/playground' })

	-- Manage themes
	use({ "zaldih/themery.nvim" })

	use({ "mbbill/undotree" })

	-- Git tools
	use({ "tpope/vim-fugitive" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use({ "echasnovski/mini.nvim" })

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		--    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	})

	-- File tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended

			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})

	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})

	-- PHP template syntax highlighting
	use({ "jwalton512/vim-blade" })

	-- use({ "andymass/vim-matchup" })
	--
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})

	use({ "windwp/nvim-ts-autotag" })
	use({ "windwp/nvim-autopairs" })

	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	-- Spelling (not sure it works)
	use({ "kamykn/spelunker.vim" })

	-- Clipboard manager. Doesnt seem to be working
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			-- you'll need at least one of these
			-- {'nvim-telescope/telescope.nvim'},
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require("neoclip").setup()
		end,
	})

	-- Surround words with symbols ("", '', [], {}, etc)
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})

	-- Navigate to other projects
	use({
		"ahmedkhalf/project.nvim",
	})

	-- Tabline
	use({
		"willothy/nvim-cokeline",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"stevearc/resession.nvim",
		},
	})

	-- Commands for comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({ "lewis6991/gitsigns.nvim" })

	-- Git diff view
	use({ "sindrets/diffview.nvim" })

	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Utils/formatting for prisma
	use({ "prisma/vim-prisma" })

	-- Movement actions, possibly not in use
	use({ "ggandor/leap.nvim" })

	use({ "rktjmp/lush.nvim" })
	use({ "~/AppData/local/nvim/lushtheme" })

	-- Diagnostics
	use({ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } })

	-- Scrollbar
	use("petertriho/nvim-scrollbar")

	use({ "MunifTanjim/nui.nvim" })

	use({ "brenoprata10/nvim-highlight-colors" })

	use({ "lukas-reineke/indent-blankline.nvim" })

	-- Jump to search term with character
	use({ "folke/flash.nvim" })

	-- Integrated termincal
	use({ "akinsho/toggleterm.nvim" })

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		-- tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	use({ "saadparwaiz1/cmp_luasnip" })

	-- Formatter
	use({ "stevearc/conform.nvim" })

	use({ "klen/nvim-test" })

	-- Highlight instances of word under cursor
	use({ "RRethy/vim-illuminate" })

	use({ "mfussenegger/nvim-lint" })

	use({ "barrett-ruth/live-server.nvim" })

	use({ "danymat/neogen" })

	use({ "ray-x/lsp_signature.nvim" })

	use({ "nvim-treesitter/nvim-treesitter-context" })

	-- Search and replace. Need a better alternative
	use({ "cshuaimin/ssr.nvim" })

	use({ "MunifTanjim/prettier.nvim" })

	-- Formatter. Conform might be working instead of this
	use({ "sbdchd/neoformat" })

	-- Symbols outline
	use({ "hedyhli/outline.nvim" })

	use({
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
		},
		config = true,
	})

	-- Jump to the next reference
	use({ "mawkler/refjump.nvim" })

	-- use {"mg979/vim-visual-multi"}

	use({ "bassamsdata/namu.nvim" })
end)
