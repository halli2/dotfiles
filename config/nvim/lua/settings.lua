local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require 'utils'
local opt = utils.opt
-- local autocmd = utils.autocmd

-- Settings
local buffer = {o, bo}
local window = {o, wo}
opt('scrolloff', 7)
opt('number', true, window)
opt('relativenumber', true, window)
opt('tabstop', 4, buffer)
opt('softtabstop', 0, buffer)
opt('expandtab', true, buffer)
opt('shiftwidth', 2, buffer)
opt('ignorecase', true)
opt('smartcase', true)
opt('mouse', 'nivh')
opt('cursorline', true, window)
opt('showmatch', true)
opt('smarttab', true)

-- Golang
cmd('autocmd BufWritePre *.go :silent! lua require("go.format").gofmt()')
cmd('autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)')
cmd('autocmd Filetype go setlocal noexpandtab')


-- Colorscheme
opt('termguicolors', true)
g.tokyonight_style = 'storm'
g.tokyonight_italic_functions = true
g.tokyonight_sidebars = {'terminal', 'packer'}
-- vim.g.tokyonight_colors = {hint = 'orange', error = '#ff0000'}
cmd'colorscheme tokyonight'
