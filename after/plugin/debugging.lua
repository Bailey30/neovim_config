local ok, dap = pcall(require, "dap")
if not ok then
	return
end
local dap_python = require("dap-python")
local mason_registry = require("mason-registry")
-- local debugpy_root   = mason_registry.get_package("debugpy"):get_install_path()

dap_python.setup("C:\\Users\\Baile\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe")

require("nvim-dap-virtual-text").setup()
require("dapui").setup()
local dapui = require("dapui")

local function end_session()
	dap.terminate()
	dapui.close()
end

vim.keymap.set("n", "<F2>", dap.continue)
-- vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F6>", end_session)
vim.keymap.set("n", "<F13>", dap.restart)
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
