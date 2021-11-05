-- Bootstrapper
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

-- Packages
return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		-- Optimisation
		use({
			"lewis6991/impatient.nvim",
			-- config = require("impatient")
			config = require("impatient").enable_profile(),
		})
		use({
			"nathom/filetype.nvim",
			config = "require('config/optimization')",
		})
		-- use("tweekmonster/startuptime.vim")

		-- File explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("nvim-tree").setup({})
			end,
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = 'require("config/lsp")',
		})
		use({
			"nvim-lua/lsp-status.nvim",
		})
		use({
			"nvim-lua/lsp_extensions.nvim",
		})
		use("jose-elias-alvarez/null-ls.nvim")

		-- Completion
		use("onsails/lspkind-nvim")
		use({
			"L3MON4D3/LuaSnip",
		})
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-nvim-lua")
		use("ray-x/cmp-treesitter")
		use("hrsh7th/cmp-calc")
		use("hrsh7th/cmp-emoji")
		use("f3fora/cmp-spell")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/nvim-cmp")
		use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

		-- Lua dev
		use("folke/lua-dev.nvim")

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			requires = {
				"nvim-treesitter/nvim-treesitter-refactor",
				"nvim-treesitter/playground",
			},

			run = {
				":TSUpdate",
			},
			config = 'require("config/treesitter")',
		})

		-- DAP
		use({
			"mfussenegger/nvim-dap",
			config = 'require("config/dap")',
		})

		use({
			"rcarriga/nvim-dap-ui",
			config = 'require("config/dapui")',
		})
		-- use("theHamsta/nvim-dap-virtual-text")

		-- Go
		use({
			"ray-x/go.nvim",
			config = 'require("config/go")',
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
			},
		})

		-- Buffer deletion
		use("mhinz/vim-sayonara")

		-- Comments
		use({
			"b3nj5m1n/kommentary",
			config = 'require("kommentary.config").use_extended_mappings()',
		})

		-- Indentation tracking
		use("lukas-reineke/indent-blankline.nvim")

		-- Neoterm
		use({
			"itmecho/neoterm.nvim",
			config = 'require("config/neoterm")',
		})

		-- Pretty symbol
		use("kyazdani42/nvim-web-devicons")

		-- ColorScheme
		use("navarasu/onedark.nvim")

		-- Statusline
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = 'require("config/lualine")',
		})

		-- Which key?
		use({
			"folke/which-key.nvim",
			config = 'require("config/which-key")',
		})

		-- Registers, (paste)
		use("tversteeg/registers.nvim")

		-- Sneak like
		use({
			"ggandor/lightspeed.nvim",
		})

		use({
			"junegunn/vim-easy-align",
		})

		use({
			"windwp/nvim-ts-autotag",
		})
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
