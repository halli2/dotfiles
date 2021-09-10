require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = {enable = true, use_languagetree = true},
  indent = {enable = false}, -- EXPERIMENTAL???
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm'
    },
  },
  refactor = {
    smart_rename = {enable = true, keymaps = {smart_rename = 'grr'}},
    highlight_definitions = {enable = true}
  },
}
