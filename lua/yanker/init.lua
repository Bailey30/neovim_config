local config = require("yanker.config")
local Menu = require("yanker.menu")
local History = require("yanker.history")
local System_Clipboard = require("yanker.system_clipboard")

local M = {}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("keep", opts or {}, config)

	System_Clipboard.setup()

	M.menu = Menu:new(M.config)
	M:set_keymaps(M.menu)
end

function M:set_keymaps(menu)
	-- TODO: set keymaps based off of config and account for lists for each
end

function M.open()
	M.menu:open()
end

vim.keymap.set({ "n", "i" }, "<leader>pl", function()
	M.open()
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = History.push,
})

M.setup()

return M
