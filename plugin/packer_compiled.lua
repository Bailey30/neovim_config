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
local package_path_str = "C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\share\\lua\\5.1\\?.lua;C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\Baile\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1703942320\\lib\\lua\\5.1\\?.so"
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["JABS.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\JABS.nvim",
    url = "https://github.com/matbme/JABS.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["base16-black-metal-scheme"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\base16-black-metal-scheme",
    url = "https://github.com/metalelf0/base16-black-metal-scheme"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  everforest = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  fzf = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
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
  ["hardtime.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\hardtime.nvim",
    url = "https://github.com/m4xshen/hardtime.nvim"
  },
  harpoon = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["inc-rename.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  lushtheme = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lushtheme",
    url = "C:\\Users\\Baile\\AppData\\local\\nvim\\lushtheme"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
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
  ["mini.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-cokeline"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cokeline",
    url = "https://github.com/willothy/nvim-cokeline"
  },
  ["nvim-highlight-colors"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-highlight-colors",
    url = "https://github.com/brenoprata10/nvim-highlight-colors"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-scrollbar"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\ny\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\2\0\0:-- Configuration here, or leave empty to use defaults\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["resession.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\resession.nvim",
    url = "https://github.com/stevearc/resession.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["spelunker.vim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\spelunker.vim",
    url = "https://github.com/kamykn/spelunker.vim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["themery.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\themery.nvim",
    url = "https://github.com/zaldih/themery.nvim"
  },
  ["triptych.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\triptych.nvim",
    url = "https://github.com/simonmclean/triptych.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-blade"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-blade",
    url = "https://github.com/jwalton512/vim-blade"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "C:\\Users\\Baile\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-prisma",
    url = "https://github.com/prisma/vim-prisma"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^sqlite"] = "sqlite.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0", "config", "inc-rename.nvim")
time([[Config for inc-rename.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\ny\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\2\0\0:-- Configuration here, or leave empty to use defaults\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: mellifluous.nvim
time([[Config for mellifluous.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "mellifluous.nvim")
time([[Config for mellifluous.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)

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
