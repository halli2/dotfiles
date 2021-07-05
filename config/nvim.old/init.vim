source $HOME/.config/nvim/vim-plug/plugins.vim
set number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter	 * set norelativenumber
augroup END

" FZF settings
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" set conceallevel
set conceallevel=2


" Nvim-Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'python',
		'html',
		'css',
		'bash',
		'lua',
		'json',
		'python',
		'go'
	},
	highligt = {
		enable = true,
		use_language_tree = true
	},
}
EOF
