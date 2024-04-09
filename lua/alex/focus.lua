vim.cmd [[
augroup WindowEnterCommands
    autocmd!
    autocmd WinLeave * lua darkenNormal()
    autocmd WinEnter * lua ReturnToNormal()
augroup END
]]


function LightenNormal()
    local amt = 100
    local lineNr = vim.api.nvim_get_hl(0, { name = "LineNr" })
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    local bg = normal.bg and format(normal.bg) or format(lineNr.bg)
    vim.cmd('hi OldNormal guibg=#' .. format(bg))

    -- print("OldNormal", format(normal.bg))

    print(normal.bg)
    local col = format(normal.bg)
    local num = tonumber(col, 16)
    local r = bit.rshift(num, 16) + amt
    local b = bit.band(bit.rshift(num, 8), 0x00FF) + amt
    local g = bit.band(num, 0x0000FF) + amt
    local newColor = bit.bor(g, bit.bor(bit.lshift(b, 8), bit.lshift(r, 16)))
    local newCol = string.format("#%X", newColor)
    print("newCol", newCol)
    vim.cmd("hi NewNormal guibg=" .. newCol)
    vim.cmd(":set winhl=Normal:NewNormal")
end

function format(g)
    return string.format("%06x", g)
end

function ReturnToNormal()
    vim.cmd(":set winhl=Normal:OldNormal")
end

function darkenNormal()
    local amt = 10


    local lineNr = vim.api.nvim_get_hl(0, { name = "LineNr" })
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })

    local bg = normal.bg and format(normal.bg) or format(lineNr.bg)
    vim.cmd('hi OldNormal guibg=#' .. bg)

    local col = format(normal.bg)
    local num = tonumber(col, 16)
    local r = math.max(0, bit.rshift(num, 16) - amt)
    local b = math.max(0, bit.band(bit.rshift(num, 8), 0x00FF) - amt)
    local g = math.max(0, bit.band(num, 0x0000FF) - amt)
    local newColor = bit.bor(g, bit.bor(bit.lshift(b, 8), bit.lshift(r, 16)))
    local newCol = string.format("#%X", newColor)
    vim.cmd("hi NewNormal guibg=" .. newCol)
    vim.cmd(":set winhl=Normal:NewNormal")
end
