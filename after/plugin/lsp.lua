-- :Mason to open window
-- "i" to install
-- https://github.com/williamboman/mason.nvim?tab=readme-ov-file
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } })
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"rust_analyzer",
		"gopls",
		"psalm",
		"html",
		"cssls",
		"yamlls",
		"jsonls",
		"lua_ls",
		"java_language_server",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})
-- this makes numbers in the number column display colors of diagnostic errors
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
		},
	},
})

require("lspconfig").pyright.setup({
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off", -- Reduce strict type checking
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				django = true,
			},
		},
	},
})

require("lspconfig").ruff.setup({
	init_options = {
		settings = {
			lint = {
				enable = false,
			},
		},
	},
})

require("lspconfig").ts_ls.setup({
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "htmldjango" },
	root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
})
require("lspconfig").emmet_ls.setup({
	filetypes = { "html", "htmldjango" },
})

-- djlsp only works if the project has git initialised (run git init)
require("lspconfig").djlsp.setup({})

require("lspconfig").html.setup({
	filetypes = { "html", "htmldjango" }, -- Only attach to pure HTML files
})
-- require("lspconfig").remark_ls.setup({
-- 	settings = {
-- 		remark = {
-- 			requireConfig = true,
-- 		},
-- 	},
-- })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})

-- set correct filetype of htmldjango files
vim.filetype.add({
	pattern = {
		[".*%.html"] = function(path, bufnr)
			-- Check for common Django template syntax in the file
			local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
			if first_line:match("{%%") or first_line:match("{{") then
				return "htmldjango"
			end
			return "html"
		end,
	},
})
