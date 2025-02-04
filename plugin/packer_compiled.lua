-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\share\\lua\\5.1\\?.lua;C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bamboo.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\bamboo.nvim",
    url = "https://github.com/ribru17/bamboo.nvim"
  },
  ["base16-black-metal-scheme"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\base16-black-metal-scheme",
    url = "https://github.com/metalelf0/base16-black-metal-scheme"
  },
  catppuccin = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  everforest = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["fleet-theme-nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fleet-theme-nvim",
    url = "https://github.com/felipeagc/fleet-theme-nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  gruvbox = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["gruvbox-minor.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox-minor.nvim",
    url = "https://github.com/ricardoraposo/gruvbox-minor.nvim"
  },
  ["ice-cave.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ice-cave.nvim",
    url = "https://github.com/mcauley-penney/ice-cave.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["melange-nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\melange-nvim",
    url = "https://github.com/savq/melange-nvim"
  },
  ["mellifluous.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mellifluous.nvim",
    url = "https://github.com/ramojus/mellifluous.nvim"
  },
  ["no-clown-fiesta.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\no-clown-fiesta.nvim",
    url = "https://github.com/aktersnurra/no-clown-fiesta.nvim"
  },
  ["noctis.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\noctis.nvim",
    url = "https://github.com/kartikp10/noctis.nvim"
  },
  nvim = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim",
    url = "https://github.com/Biscuit-Colorscheme/nvim"
  },
  ["nvim-tundra"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tundra",
    url = "https://github.com/sam4llis/nvim-tundra"
  },
  ["oh-lucy.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\oh-lucy.nvim",
    url = "https://github.com/Yazeed1s/oh-lucy.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["vim-aylin"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-aylin",
    url = "https://github.com/AhmedAbdulrahman/vim-aylin"
  },
  ["vim-colors-plain"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-colors-plain",
    url = "https://github.com/andreypopp/vim-colors-plain"
  },
  ["zenbones.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mellifluous.nvim
time([[Config for mellifluous.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "mellifluous.nvim")
time([[Config for mellifluous.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
