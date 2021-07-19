-- Bootstrapper
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Packages
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = 'require("config/lsp")'
  }
  use {
    'nvim-lua/lsp-status.nvim',
  }
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/nvim-compe'
  --[[ use {
    'ray-x/navigator.lua',
    requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
   config = 'require"navigator".setup()'
  } ]]

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/playground'
    },

    run ={
      ':TSUpdate',
      ':TSInstall query',
      }
  }

  -- DAP
  use 'mfussenegger/nvim-dap'

  use {
    'rcarriga/nvim-dap-ui',
    --config = 'require("config/dapui")'
  }
  use 'theHamsta/nvim-dap-virtual-text'

  -- Go
 use {
   'ray-x/go.nvim',
   config = 'require("config/go")'
 }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    },
  }

  -- Buffer deletion
  use 'mhinz/vim-sayonara'

  -- Comments
  use {
    'b3nj5m1n/kommentary',
    config = 'require("kommentary.config").use_extended_mappings()'
  }

  -- Indentation tracking
  use 'lukas-reineke/indent-blankline.nvim'

  -- Git
  use 'tpope/vim-fugitive'

  -- Pretty symbol
  use 'kyazdani42/nvim-web-devicons'

  -- ColorScheme
  use 'folke/tokyonight.nvim'

  -- Which key?
  use {
    'folke/which-key.nvim',
    config = 'require("config/which-key")'
  }

end)
