require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    --ignore_install = {'javascript'},
    highlight = {
        enable = true,
        --disable = {'c', 'rust'},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    indent = {
        enable = true
    }
}

if pcall(require, "nvim-treesitter.parsers") then
  require "nvim-treesitter.parsers".get_parser_configs().solidity = {
    install_info = {
      -- url = "https://github.com/JoranHonig/tree-sitter-solidity",
      url = "https://github.com/ibhagwan/tree-sitter-solidity",
      files = {"src/parser.c"},
      requires_generate_from_grammar = true,
    },
    filetype = 'solidity'
  }
  -- install with ':TSInstallSync markdown'
  require "nvim-treesitter.parsers".get_parser_configs().markdown = {
    install_info = {
      url = "https://github.com/ikatyang/tree-sitter-markdown",
      files = { "src/parser.c", "src/scanner.cc" },
    }
  }
end
