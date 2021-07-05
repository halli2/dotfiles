return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    
    -- Fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- Cheat sheet with telescope
    use {'sudormrfbin/cheatsheet.nvim'} -- Uses <leader>?
    
    
    -- Lsp / coding
    use {'neovim/nvim-lspconfig'}
    use {'kabouzeid/nvim-lspinstall'}
    use {'hrsh7th/nvim-compe'}
    use {'b3nj5m1n/kommentary',
        -- uncomment for lazy loading
        keys = {'gcc', 'gc'}
    }
    use {'lukas-reineke/indent-blankline.nvim'}
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run=':TSUpdate'
    }
    -- Git
    use {'tpope/vim-fugitive'}
    --[[use {'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }]]--
end)
