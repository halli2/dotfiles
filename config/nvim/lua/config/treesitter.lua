-- Needed for custom parsers
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- vim.cmd([[au BufRead,BufNewFile *.wgsl	set filetype=wgsl]])
--[[ parser_configs.wgsl = {
	install_info = {
		url = "https://github.com/szebniok/tree-sitter-wgsl",
		files = { "src/parser.c" },
	},
} ]]
--[[ -- Norg Support (has to be before treesitter.setup
parser_configs.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}

-- Markdown support..
parser_configs.markdown = {
	install_info = {
		url = "https://github.com/ikatyang/tree-sitter-markdown",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "markdown",
} ]]

-- Treesitter setup
require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = { enable = true, use_languagetree = true },
	indent = { enable = true }, -- EXPERIMENTAL???
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	refactor = {
		smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
		highlight_definitions = { enable = true },
	},
	-- nvim-ts-autotag plugin (html autoclosign)
	autotag = {
		enable = true,
	},
})
