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
local package_path_str = "/home/halli/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/halli/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/halli/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/halli/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/halli/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config.gitsigns')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["iron.nvim"] = {
    commands = { "IronRepl", "IronSend", "IronReplHere" },
    config = { "require('config.iron')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/iron.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  mesonic = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/mesonic"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "require('config.neogit')" },
    loaded = false,
    needs_bufread = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  neorg = {
    config = { "require('config.neorg')" },
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('colorizer').setup {'css', 'javascript', 'vim', 'html'}" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/halli/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "require('config.compe')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pddl.vim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/pddl.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["registers.nvim"] = {
    keys = { { "n", '"' }, { "i", "<c-r>" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/registers.nvim"
  },
  snap = {
    config = { "require('config.snap')" },
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/snap"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('config.telescope')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-matchup"] = {
    after_files = { "/home/halli/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/halli/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    config = { "vim.g.startuptime_tries = 10" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-vsnip"] = {
    config = { "require('config.vsnip')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/halli/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('config.telescope_setup')
time([[Setup for telescope.nvim]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
require('config.matchup')
time([[Setup for vim-matchup]], false)
-- Setup for: iron.nvim
time([[Setup for iron.nvim]], true)
vim.g.iron_map_defaults = 0
time([[Setup for iron.nvim]], false)
-- Config for: snap
time([[Config for snap]], true)
require('config.snap')
time([[Config for snap]], false)
-- Config for: neorg
time([[Config for neorg]], true)
require('config.neorg')
time([[Config for neorg]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file IronRepl lua require("packer.load")({'iron.nvim'}, { cmd = "IronRepl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file IronSend lua require("packer.load")({'iron.nvim'}, { cmd = "IronSend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file IronReplHere lua require("packer.load")({'iron.nvim'}, { cmd = "IronReplHere", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[inoremap <silent> <c-r> <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "<lt>c-r>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> " <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "\"", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'vim-matchup', 'gitsigns.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'vim-vsnip', 'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
