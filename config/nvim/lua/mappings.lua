local g = vim.g
local utils = require("utils")
local map = utils.map
local options = { noremap = true }
local cmd = vim.cmd

-- Leader/local leader
g.mapleader = " "
g.maplocalleader = ","

-- General stuff
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
map("n", "<localleader>mm", "<cmd>set hlsearch!<cr>")

---- Telescope
map("n", "<localleader>T", '<cmd>lua require("telescope.command").load_command()<cr>')
map(
	"n",
	"<localleader>ff",
	'<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_ivy())<cr>'
)
map(
	"n",
	"<localleader>fg",
	'<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())<cr>'
)
map("n", "<localleader>fb", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_ivy())<cr>')
map(
	"n",
	"<localleader>fh",
	'<cmd>lua require("telescope.builtin").help_tags(require("telescope.themes").get_ivy())<cr>'
)
map(
	"n",
	"<localleader>f_",
	'<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy(),{sorting_strategy="ascending", layout_config={prompt_position="top"}})<cr>'
)
---- Golang
-- map('n', '<leader>t', '<cmd>GoTest<cr>', options)
-- Sayonara
map("n", "<leader>å", "<cmd>Sayonara<cr>")
-- Luatree
map("n", "<localleader>e", "<cmd>NvimTreeToggle<cr>", options)
----- General
map("n", "<leader>n", ":bnext<cr>", options)
map("n", "<leader>p", ":bprev<cr>", options)
map("n", "<localleader>w", ":w<cr>", options)
cmd('autocmd Filetype python nnoremap <buffer> <leader>t :w<cr>:ter python "%"<cr>')
cmd("autocmd Filetype go nnoremap <buffer> <leader>t :w<cr>:GoTest<cr>")
-- Neoterm
-- map('n', '<localleader>tt', '<cmd>NeotermInteractive<cr>')
map("n", "<localleader>tt", "<cmd>NeotermToggle<cr>")
map("n", "<localleader>ts", ":NeotermRun ")
map("n", "<localleader>tr", "<cmd>NeotermReRun<cr>")
map("n", "<localleader>tx", "<cmd>NeotermExit<cr>")
map("t", "<localleader>tn", "<C-\\><C-n>")
-- map('t', '<localleader>tt', '<cmd>NeotermInteractive<cr>')
map("t", "<localleader>tt", "<cmd>NeotermToggle<cr>")
map("t", "<localleader>tx", "<cmd>NeotermExit<cr>")

-- DAP
map("n", "<F2>", '<cmd>lua require("dap").continue()<cr>', options)
map("n", "<leader>dq", '<cmd>lua require("dap").disconnect()<cr>', options)
map("n", "<F3>", '<cmd>lua require("dap").step_over()<cr>', options)
map("n", "<F4>", '<cmd>lua require("dap").step_into()<cr>', options)
map("n", "<leader>db", '<cmd>lua require("dap").toggle_breakpoint()<cr>', options)
map("n", "<leader>dr", '<cmd>lua require("dap").repl.open()<cr>', options)
-- map('n', '<leader>ds', '<cmd>lua require("dap-python").test_method()<cr>', options) -- Need mfussenegger/dap-python
--nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
-- map('n', '<leader>ds', '<cmd>lua require("dap-python").debug_selection()<cr>', options)

-- DAPUI
map("n", "<leader>duo", '<cmd>lua require("dapui").open()<cr>', options)
map("n", "<leader>duc", '<cmd>lua require("dapui").close()<cr>', options)
map("n", "<leader>dt", '<cmd>lua require("dapui").toggle()<cr>', options)
map("n", "<leader>due", '<cmd>lua require("dapui").eval()<cr>', options)

-- LSP
map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- if client.resolved_capabilities.document_formatting then
-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
-- end
-- FZF_LSP
map("n", "GD", '<Cmd>lua require"fzf_lsp".declaration_call()<CR>', opts)
map("n", "Gd", '<Cmd>lua require"fzf_lsp".definition_call()<CR>', opts)

--[[ require'fzf_lsp'.code_action_call
require'fzf_lsp'.range_code_action_call
require'fzf_lsp'.definition_call
require'fzf_lsp'.declaration_call
require'fzf_lsp'.type_definition_call
require'fzf_lsp'.implementation_call
require'fzf_lsp'.references_call
require'fzf_lsp'.document_symbol_call
require'fzf_lsp'.workspace_symbol_call
require'fzf_lsp'.incoming_calls_call
require'fzf_lsp'.outgoing_calls_call
require'fzf_lsp'.diagnostic_call ]]
