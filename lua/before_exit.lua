-- vim.api.nvim_create_autocmd("CmdPre", {
-- 	pattern = "q",
-- 	callback = function()
-- 		local choice = vim.fn.confirm("Are you sure you want to quit?", "&Yes\n&No", 2)
-- 		if choice ~= 1 then
-- 			-- Abort the command if user says No
-- 			-- 1) Print a message
-- 			vim.cmd('echo "Aborting quit..."')
-- 			-- 2) Throw an error to interrupt the `:q`
-- 			error("User canceled quit")
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		print("cmdleave")
	end,
})
