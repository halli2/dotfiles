local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require("utils")
local opt = utils.opt
-- local autocmd = utils.autocmd

-- Settings
local buffer = { o, bo }
local window = { o, wo }
-- opt('scrolloff', 7)
opt("number", true, window)
opt("relativenumber", true, window)
opt("tabstop", 4, buffer)
opt("softtabstop", 0, buffer)
opt("expandtab", true, buffer)
opt("shiftwidth", 4, buffer)
opt("ignorecase", true)
opt("smartcase", true)
opt("mouse", "nivh")
opt("cursorline", true, window)
opt("showmatch", true)
opt("smarttab", true)
opt("autowrite", true) -- enable auto write
opt("clipboard", "unnamedplus") -- sync with system clipboard
opt("list", true) -- show some invisible characters (tabs...
opt("scrolloff", 4) -- Lines of context
opt("wildmode", "longest:full,full") -- Command-line completion mode
opt("inccommand", "split") -- Show what's changed when %s/''/''

-- Use proper syntax highlighting in code blocks
local fences = {
	"lua",
	-- 'vim',
	"json",
	"typescript",
	"javascript",
	"js=javascript",
	"ts=typescript",
	"shell=sh",
	"python",
	"sh",
	"console=sh",
}
g.markdown_fenced_languages = fences

-- Golang
cmd("autocmd Filetype go setlocal noexpandtab")

-- Colorscheme
-- g.onedark_style = 'warm'
opt("termguicolors", true)
require("onedark").setup()
