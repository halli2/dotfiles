-- Map leader to space
vim.g.mapleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

-- Different settings
require ('settings')
require ('keymappings')

-- Auto install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Load plugins
require ('plugins')

-- Lsp configuration
require ('lsp')
-- Treesitter
require ('treesitter')

