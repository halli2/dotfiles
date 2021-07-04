" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " MD editing, Ultisnippets and vim snippets"
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/goyo.vim'
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240

    " Color name (:help gui-colors) or RGB color
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'

    " Default: 0.5
    let g:limelight_default_coefficient = 0.7

    " Number of preceding/following paragraphs to include (default: 0)
    let g:limelight_paragraph_span = 1

    " Beginning/end of paragraph
    "   When there's no empty line between the paragraphs
    "   and each paragraph starts with indentation
    let g:limelight_bop = '^\s'
    let g:limelight_eop = '\ze\n^\s'

    " Highlighting priority (default: 10)
    "   Set it to -1 not to overrule hlsearch
    let g:limelight_priority = -1
    " tabular plugin is used to format tables
    Plug 'godlygeek/tabular'
    " JSON front matter highlight plugin
    Plug 'elzr/vim-json'
    "Plug 'plasticboy/vim-markdown'
    " disable header folding
    "let g:vim_markdown_folding_disabled = 1

    " do not use conceal feature, the implementation is not so good
    "let g:vim_markdown_conceal = 0

    " disable math tex conceal feature
    "let g:tex_conceal = ""
    "let g:vim_markdown_math = 1

    " support front matter of various format
    "let g:vim_markdown_frontmatter = 1  " for YAML format
    "let g:vim_markdown_toml_frontmatter = 1  " for TOML format
    "let g:vim_markdown_json_frontmatter = 1  " for JSON format
    "Plug 'vim-pandoc/vim-pandoc'
    "Plug 'vim-pandoc/vim-pandoc-syntax'
    "augroup pandoc_syntax
    "    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    "augroup END
    " if you don't have node and yarn, use pre build
    "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    " do not close the preview tab when switching to other buffers
    "let g:mkdp_auto_close = 0
    Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'easymotion/vim-easymotion'

    " Vimtex plugin, for writing .tex
    Plug 'lervag/vimtex'

call plug#end()

