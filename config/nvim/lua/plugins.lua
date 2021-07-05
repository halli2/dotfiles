-- This file can be loaded by calling 'lua require('plugins') from your init

return require('packer').startup(function()
	-- Packer can manager itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}
    
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

    -- Lua development
    use {'tjdevries/nlua.nvim'}

end)
