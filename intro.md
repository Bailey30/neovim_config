Neovim API: A Practical Guide

Introduction

Neovim provides an API that lets you manipulate buffers, windows, and editor behavior using Lua. This guide introduces core concepts and practical examples.

---

1. Core Concepts

Understanding Neovim's API Structure

Neovim's API can be accessed using:

- vim.api -> Direct access to Neovim's API functions (low-level)
- vim.fn -> Calls Vimscript functions from Lua
- vim.cmd -> Executes raw Vim commands
- vim.bo, vim.wo, vim.o -> Access buffer, window, and global options

Buffers, Windows, and Tabs

- Buffer (buf) -> Holds file contents
- Window (win) -> A viewport showing part of a buffer
- Tabpage (tab) -> A collection of windows

These allow you to control Neovim programmatically.

---

2. Navigating the API Documentation

Using ':h' for Help

- ':h api' -> API overview
- ':h lua' -> Lua support in Neovim
- ':h vim.api' -> List of API functions
- ':h vim.fn' -> Vimscript functions in Lua
- ':h vim.cmd' -> Running Vim commands in Lua
- ':h nvim*buf*' -> Buffer-related functions

Using Autocomplete

While typing in Neovim:

':lua =vim.api.nvim\_'

Press '<Tab>' to see available functions.

Debugging API Calls

Use 'vim.inspect' to print values:

print(vim.inspect(vim.api.nvim_list_bufs())) -- Print all buffer IDs
print(vim.inspect(vim.api.nvim_win_get_cursor(0))) -- Print cursor position

---

3. Practical Examples

Getting Cursor and File Info

print("Current Line: " .. vim.fn.line('.'))
print("Current Column: " .. vim.fn.col('.'))
print("Total Lines: " .. vim.fn.line('$'))

Get Current Buffer Content

local buf = vim.api.nvim_get_current_buf()
local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false) -- Get all lines
print(vim.inspect(lines))

Move Cursor to a Specific Line

vim.api.nvim_win_set_cursor(0, {10, 0}) -- Move to line 10, column 0

Create a Custom Command

vim.api.nvim_create_user_command('LineCount', function()
print("Total lines: " .. vim.fn.line('$'))
end, {})

Run this command in Neovim using ':LineCount'.

Set an Option in Lua

vim.o.number = true -- Enable line numbers
vim.wo.relativenumber = true -- Enable relative numbers in the window

Create an Autocommand

vim.api.nvim_create_autocmd("BufWritePost", {
pattern = "\*.lua",
callback = function()
print("File saved!")
end,
})

---

4. Additional Learning Resources

- Official Neovim Lua Guide: neovim.io/doc/user/lua-guide.html
- Awesome Neovim (plugins, guides): github.com/rockerBOO/awesome-neovim
- Neovim API Docs (Online): neovim.io/doc/user/api.html
