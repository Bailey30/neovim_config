-- Function to toggle Neo-tree
local function toggle_neotree()
	print("toggle neotree")
	-- Function to check if the current buffer is Neo-tree
	local function is_neotree_open()
		local bufnr = vim.api.nvim_get_current_buf()
		-- Get the filetype of the current buffer
		local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
		print(filetype)
		return filetype == "neo-tree"
	end

	if is_neotree_open() then
		vim.cmd("Neotree close")
	else
		vim.cmd("Neotree reveal")
	end
end

-- vim.api.nvim_set_keymap("n", '<C-b>', ':lua toggle_neotree()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree toggle position=current<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>m", ":Neotree toggle position=left<CR>", { noremap = true, silent = true })

-- Function to check the filetype of the current buffer
local function check_filetype()
	local bufnr = vim.api.nvim_get_current_buf()
	local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
	print("Current filetype: " .. filetype)
end

-- Using this as state to store the last open buffer so it can be used to move the cursor to the
-- name of the file in Neo-tre when it opens.
local last_buf = ""

require("neo-tree").setup({
	event_handlers = {
		{
			event = "neo_tree_window_before_open",
			handler = function()
				-- Save the name of the buffer you are in before opening Neo-tree.
				local file_name = vim.fn.split(vim.fn.expand("%"), "\\")
				last_buf = file_name[#file_name]
			end,
		},
		{
			event = "after_render",
			handler = function()
				if last_buf:match("^.+%.%w+$") then
					-- Seems to just go to right line without doing anything else.
					vim.fn.search(last_buf)
					last_buf = ""
				end
			end,
		},
	},
	default_component_configs = {
		created = {
			enabled = true,
		},
		indent = {
			indent = 10,
		},
		icon = {
			highlight = "Normal",
		},
		name = {
			trailing_slash = true,
		},
	},
	icon = {
		default = "",
	},
	window = {
		width = 50,
		position = "current",
		mapping_options = {
			noremap = true,
		},
		mappings = {
			["b"] = "close_window",
		},
	},
	filesystem = {
		-- hijack_netrw_behaviour = "disable"
		follow_current_file = {
			enabled = true,
		},
		components = {
			-- disables icons
			icon = function()
				return {
					text = "",
					highlight = "",
				}
			end,
		},
	},
})
