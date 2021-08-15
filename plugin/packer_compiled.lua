-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/xuanxuan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/xuanxuan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/xuanxuan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/xuanxuan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/xuanxuan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  LeaderF = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/LeaderF"
  },
  ["accelerated-jk"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/beacon.nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  hop = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/hop"
  },
  indentLine = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neomake = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/neomake"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  onehalf = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/onehalf/vim/"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-cheat40"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-cheat40"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-cursorword"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-cursorword"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vim-xkbswitch"] = {
    loaded = true,
    path = "/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/vim-xkbswitch"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/Users/xuanxuan/.local/share/nvim/site/pack/packer/start/onehalf/vim/"
time([[Runtimepath customization]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
