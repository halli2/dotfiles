source $HOME/.config/nvim/vim-plug/plugins.vim
set number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter	 * set norelativenumber
augroup END
let g:vim_markdown_folding_disabled = 1
