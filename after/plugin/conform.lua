require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettierd" },
		html = { "prettier" },
		css = { "prettier" },
		-- ["*"] = { "codespell" },
		djangohtml = { "djlint" },
		-- markdown = { { "remark" } },
	},
	-- formatters = {
	--     prettier = {
	--         command = "./prettier.json"
	--         -- printiidth = 200
	--         -- prepend_args = { "--single-quote" }
	--     }
	-- },
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
	},
})

-- require("conform").formatters.prettier = {
--     prepend_args = { "--print-width 400" }
-- }

local function logTable(t, indent)
	indent = indent or 0
	local padding = string.rep("  ", indent)

	for k, v in pairs(t) do
		if type(v) == "table" then
			print(padding .. tostring(k) .. " = {")
			logTable(v, indent + 1)
			print(padding .. "}")
		else
			print(padding .. tostring(k) .. " = " .. tostring(v))
		end
	end
end
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })
