local packer = nil
local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init {disable_commands = true}
  end

  local use = packer.use
  packer.reset()

  --Packer
  use 'wbthomason/packer.nvim'

  -- Async building & commands
  use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

  -- Registers
  -- use 'junegunn/vim-peekabo'
  
  use { 'camspiers/snap', rocks = {'fzy'}} -- If fzy sucks use fzf?

  -- Marks
  use {'kshenoy/vim-signature', config = "require('config.signature')", disable = true}

  use {'tversteeg/registers.nvim', keys = { {'n', '"'}, {'i', '<c-r>'} } }

  --Buffer management
  use {'mhinz/vim-sayonara', cmd = 'Sayonara'}

  -- Movement
  use {'chaoren/vim-wordmotion'}
  use {'justinmk/vim-sneak'}

  -- Quickfix
  use {'Olical/vim-enmasse', cmd = 'EnMasse'}
  use {'kevinhwang91/nvim-bqf'}

  -- Indentation tracking
  use {'lukas-reineke/indent-blankline.nvim'}

  -- Commenting
  use {'tomtom/tcomment_vim'}
  
  -- Wrapping/delimiters
  use {'machakann/vim-sandwich'}
  use {'andymass/vim-matchup', setup = "require('config.matchup')", event = 'BufEnter'}
  
  -- Search
  use {'romainl/vim-cool'}

  -- Prettification
  use {'junegunn/vim-easy-align'}
  use {'mhartington/formatter.nvim'}
  
  -- Text Objects
  use {'wellle/targets.vim'}

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    setup = "require('config.telescope_setup')",
    config = "require('config.telescope')",
    cmd = 'Telescope',
  }

  -- Project Management/Sessions
  use {
    'dhruvasagar/vim-prosession',
    after = 'vim-obsession',
    requires = {{'tpope/vim-obsession', cmd = 'Prossesion'}},
    config = "require('config.prossesion')",
  }

  -- Undo tree
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = "vim.g.undotree_SetFocusWhenToggle = 1",
  }

  -- Git
  use {'tpope/vim-fugitive', cmd = {'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull'}, disable = true}
  use {
      'lewis6991/gitsigns.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = "require('config.gitsigns')",
      event = 'BufEnter',
    }
  use {'TimUntersberger/neogit', cmd = 'Neogit', config = "require('config.neogit')"}

  -- Pretty symbols
  use {'kyazdani42/nvim-web-devicons'}

  -- Terminal
  use {'voldikss/vim-floaterm'}

  -- REPLs
  use {
    'hkupty/iron.nvim',
    setup = "vim.g.iron_map_defaults = 0",
    config = "require('config.iron')",
    cmd = {'IronRepl', 'IronSend', 'IronReplHere'},
  }

  -- Completion and linting
  use {
    'onsails/lspkind-nvim',
    'neovim/nvim-lspconfig',
    'nvim-lua/lsp-status.nvim',
    'folke/trouble.nvim',
    'ray-x/lsp_signature.nvim',
    'glepnir/lspsaga.nvim',
  }

  -- Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate',
  }

  -- Just for tracking progess until this is ready for use
  use 'mfussenegger/nvim-lint'

  use { 'hrsh7th/nvim-compe', config = [[require('config.compe')]], event = 'InsertEnter *' }
  use { 'hrsh7th/vim-vsnip', config = [[require('config.vsnip')]], event = 'InsertEnter *' }

  -- Debugger
  use {'mfussenegger/nvim-dap', opt = true}
  use {
    'puremourning/vimspector',
    setup = "vim-g-vimspector_enable_mappings = 'HUMAN'",
    disable = true
  }

  -- Path navigation
  use {'justinmk/vim-dirvish'}

  -- Latex
  use {'lervag/vimtex'}

  -- Meson
  use {'igankevich/mesonic', disable = true}

  -- PDDL
  use {'PontusPersson/pddl.vim', disable = true}

  -- Zig
  use {'ziglang/zig.vim', disable = true}

  -- Julia
  use {'JuliaEditorSupport/julia-vim', setup = [[vim.g.latex_to_unicode_tab = 'off']], opt = true, disable = true}

  -- Profiling
  use {'dstein64/vim-startuptime', cmd = 'StartupTime', config = "vim.g.startuptime_tries = 10"}

  -- Plugin development
  use {'folke/lua-dev.nvim'}

  -- Highlight colors
  use {
    'norcalli/nvim-colorizer.lua',
    ft = {'css', 'javascript', 'vim', 'html'},
    config = "require('colorizer').setup {'css', 'javascript', 'vim', 'html'}",
  }

  -- Color scheme
  use {'wbthomason/vim-nazgul'}
  use {'hardselius/warlock'}
  use {'arzg/vim-substrata'}
  use {'sainnhe/gruvbox-material'}

  -- Notes
  use {
    'wbthomason/pdf-scribe.nvim',
    config = "require('config.pdf_scribe')",
    disable = true,
  }

  use {'kristijanhusak/orgmode.nvim', opt = true}

  -- Markdown
  use {
    'plasticboy/vim-markdown',
    requires = {'godlygeek/tabular'},
    opt = true,
    disable = true
  }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
