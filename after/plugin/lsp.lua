-- local lsp_zero = require("lsp-zero")
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf, remap = false }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } })
		end, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
	end,
})

require("mason").setup()
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
		-- "java_language_server",
		-- "ruff",
		-- "emmet_ls",
		-- "djlsp",
		-- "prismals",
	},
})

require("mason-nvim-dap").setup({
	ensure_installed = { "python" },
})

vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

-- Per-server config
vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".git", vim.uv.cwd() },
	settings = {
		Lua = {
			telemetry = { enable = false },
			diagnostics = { globals = { "vim", "require" } },
		},
	},
}

vim.lsp.config.pyright = {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "on",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				django = true,
			},
		},
	},
}

vim.lsp.config.tsserver = {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"htmldjango",
	},
	root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
}

vim.lsp.config.ruff = {
	init_options = {
		settings = {
			lint = {
				enable = false,
			},
		},
	},
}

vim.lsp.config.emmet_ls = {
	filetypes = { "html", "htmldjango" },
}

vim.lsp.config.html = {
	filetypes = { "html", "htmldjango" },
}

vim.lsp.config.djlsp = {}

vim.lsp.config.prismals = {
	filetypes = { "prisma" },
}

-- Enable all configured servers
vim.lsp.enable({
	"lua_ls",
	"pyright",
	"ts_ls",
	"ruff",
	"emmet_ls",
	"html",
	"djlsp",
	"prismals",
	"rust_analyzer",
	"gopls",
	"psalm",
	"cssls",
	"yamlls",
	"jsonls",
	"java_language_server",
})

-- Diagnostics
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
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
		},
	},
})

-- nvim-cmp setup
-- local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- cmp.setup({
-- 	sources = {
-- 		{ name = "path" },
-- 		{ name = "nvim_lsp" },
-- 		{ name = "nvim_lua" },
-- 		{ name = "luasnip", keyword_length = 2 },
-- 		{ name = "buffer", keyword_length = 3 },
-- 	},
-- 	formatting = lsp_zero.cmp_format(),
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
-- 		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 	}),
-- })
--

require("blink-cmp").setup({
	completion = {
		menu = { border = "single" },
		documentation = { window = { border = "single" }, auto_show = true, auto_show_delay_ms = 500 },
	},
	signature = { window = { border = "single" }, enabled = true },
	keymap = {
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
	},
	trigger = {
		show_on_trigger_character = true,
	},
	snippets = {
		-- Function to use when expanding LSP provided snippets
		expand = function(snippet)
			vim.snippet.expand(snippet)
		end,
		-- Function to use when checking if a snippet is active
		active = function(filter)
			return vim.snippet.active(filter)
		end,
		-- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
		jump = function(direction)
			vim.snippet.jump(direction)
		end,
	},
})

-- Auto-detect htmldjango filetype
vim.filetype.add({
	pattern = {
		[".*%.html"] = function(_, bufnr)
			local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
			if first_line:match("{%%") or first_line:match("{{") then
				return "htmldjango"
			end
			return "html"
		end,
	},
})
