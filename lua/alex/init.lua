require("alex.remap")
require("alex.set")
require("alex.window")
require("alex.nui")
require("alex.statusline")

if vim.g.vscode then
    require("alex.vscode")
    print("vscode")
end
-- require("alex.focus")
