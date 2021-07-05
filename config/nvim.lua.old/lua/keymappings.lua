local utils = require('utils')

local opt = {}

-- Telescope
utils.map('n', '<leader>gt', [[<cmd> Telescope git_status <cr>]], opt) -- (With help of fugitive)
utils.map('n', '<leader>cm', [[<cmd> Telescope git_commits <cr>]], opt)
utils.map('n', '<leader>ff', [[<cmd> Telescope find_files <cr>]], opt)
-- utils.map('n', '<leader>fp', [[<cmd>lua require('telescope').extensions.media_files.media_files()<cr>]], opt) -- Uberzug doesn't work on wayland?
utils.map('n', '<leader>fb', [[<cmd> Telescope buffers <cr>]], opt)
utils.map('n', '<leader>fh', [[<cmd> Telescope help_tags <cr>]], opt)
utils.map('n', '<leader>fo', [[<cmd> Telescope oldfiles <cr>]], opt)

-- LSP Mappings see lsp_lua/init.lua 
-- Completion see config/completion.lua


