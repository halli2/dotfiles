local snap = require'snap'
snap.maps {
  {'<leader><leader>', snap.config.file {producer = 'ripgrep.file'}},
  {'<leader>fb', snap.config.file {producer = 'vim.buffer'}},
  {'<leader>fo', snap.config.file {producer = 'vim.oldfile'}},
  {'<leader>ff', snap.config.vimgrep {}},
}

-- standard mappings (non functional code)
--   mappings = {
--   ["enter-split"] = {"<C-x>"},
--   ["enter-tab"] = {"<C-t>"},
--   ["enter-vsplit"] = {"<C-v>"},
--   ["next-item"] = {"<C-n>"},
--   ["next-page"] = {"<C-f>"},
--   ["prev-item"] = {"<C-p>"},
--   ["prev-page"] = {"<C-b>"},
--   ["select-all"] = {"<C-a>"},
--   ["view-page-down"] = {"<C-d>"},
--   ["view-page-up"] = {"<C-u>"},
--   ["view-toggle-hide"] = {"<C-h>"},
--   enter = {"<CR>"},
--   exit = {"<Esc>", "<C-c>"},
--   next = {"<C-q>"},
--   select = {"<Tab>"},
--   unselect = {"<S-Tab>"}
--   }
