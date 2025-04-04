local nvim_utils = require("yank_yank.utils").nvim_utils

local History = {
	config = {},
}

function History:setup(menu)
	self.config.menu = menu
end

function History:push()
	local stdpath = vim.fn.stdpath("state")
	local yank = nvim_utils.get_register_contents()

	print(vim.fn.index(self.config.menu.unformatted_lines, yank))
	if vim.fn.index(self.config.menu.unformatted_lines, vim.fn.trim(yank, "\n")) == -1 then
		vim.fn.writefile({ vim.fn.trim(yank, "\n") }, stdpath .. "/clipboard.txt", "a")
	end
end

function History.get()
	local stdpath = vim.fn.stdpath("state")
	local file_contents = vim.fn.readfile(stdpath .. "/clipboard.txt", "", -100)

	-- Create a reverse order list.
	local yank_list = {}
	for i = #file_contents, 1, -1 do
		local trimmed_line = vim.fn.trim(file_contents[i])

		-- TODO: make config options for these to turn them on and off.
		-- Exclude blank lines, single characters and duplicates.
		if trimmed_line ~= "" and vim.fn.index(yank_list, trimmed_line) == -1 and #trimmed_line > 1 then
			local clean_string = file_contents[i]:gsub("\n", "↵")
			table.insert(yank_list, clean_string)
		end
	end

	return yank_list
end
return History
