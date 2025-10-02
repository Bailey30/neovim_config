local function branch_name()
	-- local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
	local fugitiveBranch = vim.api.nvim_eval("FugitiveStatusline()")
	local branch = fugitiveBranch:match("%[Git%((.-)%)%]")
	if branch and branch ~= "" then
		return " on " .. branch
	else
		return ""
	end
end

local function file_name()
	local root_path = vim.fn.getcwd()
	local root_dir = root_path:match("[^/]+$")
	local home_path = vim.fn.expand("%:~")
	local overlap, _ = home_path:find(root_dir)
	if home_path == "" then
		return root_path:gsub("/Users/[^/]+", "~")
	elseif overlap then
		return home_path:sub(overlap)
	else
		return home_path
	end
end

local function progress()
	if vim.fn.line(".") == 1 then
		return "top"
	elseif vim.fn.line(".") == vim.fn.line("$") then
		return "bot"
	else
		local p = vim.fn.line(".") / vim.fn.line("$") * 100
		p = p % 1 >= 0.5 and math.ceil(p) or math.floor(p)
		return string.format("%02d", p) .. "%%"
	end
end

local function git_diff_stat()
	local git_dir = vim.fn.finddir(".git", ".;")
	if git_dir == "" then
		return "" -- Not a Git repository
	end

	local file_path = vim.fn.expand("%:.") -- Get the file path relative to current directory
	if file_path == "" then
		return "" -- No file path (e.g., empty buffer)
	end

	-- Check if the file is tracked by Git
	local is_tracked =
		vim.fn.systemlist("git ls-files --error-unmatch " .. vim.fn.shellescape(file_path) .. " 2> /dev/null")
	if #is_tracked == 0 then
		return "?" -- File is untracked
	end

	-- Get the diff stat for the current file
	local diff_stat = vim.fn.systemlist("git diff --numstat -- " .. vim.fn.shellescape(file_path))
	if #diff_stat == 0 then
		return "" -- No changes
	end

	local added, removed = diff_stat[1]:match("(%d+)%s+(%d+)")
	if added and removed then
		return " +" .. added .. " -" .. removed
	end

	return ""
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained" }, {
	callback = function()
		vim.b.branch_name = branch_name()
		vim.b.file_name = file_name()
		vim.b.git_diff_stat = git_diff_stat()
	end,
})

function Status_Line()
	if not pcall(require, "lsp_signature") then
		return
	end
	local lsp_sig = require("lsp_signature").status_line(100)
	-- Ensure vim.b.git_status is a string
	local git_status = vim.b.git_diff_stat or ""

	return " "
		.. "%<"
		.. vim.b.file_name
		.. vim.b.branch_name
		.. (vim.b.git_diff_stat or "")
		.. " "
		.. "%h"
		.. "%m"
		-- .. lsp_sig.label
		-- .. lsp_sig.hint
		.. "%="
		.. "%y"
		.. " "
		.. progress()
		.. " "
end

vim.opt.statusline = "%{%v:lua.Status_Line()%}"
