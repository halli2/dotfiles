-- This file can be loaded by calling 'lua require('plugins') from your init

local use = require('packer').use
return require('packer').startup(function()
	-- Packer can manager itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}
    
    -- tpope's plugins that should be part of vim
    use {'tpope/vim-surround' }
    use {'tpope/vim-repeat'}


    -- Coding, completion & LSP
    -- Comments
    use {'b3nj5m1n/kommentary'} -- 'gc', 'gcc' keybinds

    -- Indent Blankline
    use {'lukas-reineke/indent-blankline.nvim'}

    -- Fugitive for Git
    use {'tpope/vim-fugitive'}

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, 
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run='make'}
        }
    }

    -- LSP and completion
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/completion-nvim'}
    use {'kabouzeid/nvim-lspinstall'}

    -- Lua development
    use {'tjdevries/nlua.nvim'}
    
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }


end)
