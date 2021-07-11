return require('packer').startup(function()
    local use = require('packer').use -- To get rid of error
    use 'wbthomason/packer.nvim'
    -- Fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- Cheat sheet with telescope
    use {'sudormrfbin/cheatsheet.nvim'} -- Uses <leader>?
    -- LSP and completion
    use { 'neovim/nvim-lspconfig' }
    use {'kabouzeid/nvim-lspinstall'}
    --
    use {'hrsh7th/nvim-compe'}
    use {'hrsh7th/vim-vsnip'}
 --   use {'SirVer/ultisnips'}
 --   use {'honza/vim-snippets'}
    --
    use {'b3nj5m1n/kommentary',
        -- uncomment for lazy loading
        keys = {'gcc', 'gc'}
    }
    use {'lukas-reineke/indent-blankline.nvim'}
    use {
        'plasticboy/vim-markdown',
        opt = true,
        requires = 'godlygeek/tabular',
        ft = 'markdown',
    }
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run=':TSUpdate'
    }
    -- Git
    -- Try neogit instead?
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
