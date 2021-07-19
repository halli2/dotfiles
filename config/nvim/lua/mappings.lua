local g = vim.g
local utils = require 'utils'
local map = utils.map
local options = {noremap = true}

-- Leader/local leader
g.mapleader = ' '
g.maplocalleader = ','

---- Telescope
map('n', '<localleader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('n', '<localleader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n', '<localleader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('n', '<localleader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
---- Golang
map('n', '<leader>t', '<cmd>GoTest<cr>', options)
-- Sayonara
map('n', '<leader>d', '<cmd>Sayonara<cr>')
----- General
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)
map('n', '<localleader>w', ':w<cr>', options)
