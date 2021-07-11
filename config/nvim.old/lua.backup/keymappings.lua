local utils = require('utils')          -- Import function to map keys

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('i', 'kj', '<Esc>')           -- kj to escape

-- Telescope keybinds
utils.map('n', '<leader>ff', '<cmd> Telescope find_files<cr>')
utils.map('n', '<leader>fg', '<cmd> Telescope live_grep<cr>')
utils.map('n', '<leader>fb', '<cmd> Telescope buffers<cr>')
utils.map('n', '<leader>fh', '<cmd> Telescope help_tags<cr>')
utils.map('n', '<leader>fo', '<cmd> Telescope oldfiles<cr>')
utils.map('n', '<leader>gt', '<cmd> Telescope git_status<cr>')
utils.map('n', '<leader>cm', '<cmd> Telescope git_commits<cr>')

