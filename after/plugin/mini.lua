require("mini.pick").setup({
	source = {
		preview = function(buf_id, item)
			local lines = vim.split(vim.inspect(item), "\n")
			vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
		end,
	},
})
