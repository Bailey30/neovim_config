require("alex.remap")
require("alex.set")
require("alex.window")
require("alex.nui")
require("alex.statusline")
require("window_title")
require("autocommands")
require("yank_yank").setup({})

if vim.g.vscode then
	require("alex.vscode")
	print("vscode")
end
-- require("alex.focus")

function _G.ReloadYank_yank()
	for name, _ in pairs(package.loaded) do
		if name:match("^yank_yank") then
			package.loaded[name] = nil
		end
	end

	require("yank_yank").setup({})
end
