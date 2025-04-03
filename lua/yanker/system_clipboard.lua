local History = require("yanker.history")
local nvim_utils = require("yanker.utils").nvim_utils
local System_clipboard = {}

function System_clipboard.setup()
	-- Setup events to add system clipboard to history when focus gained.

	vim.api.nvim_create_autocmd("FocusGained", {
		callback = function()
			History.push()
		end,
	})
end

return System_clipboard
