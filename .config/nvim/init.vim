call plug#begin('~/.local/share/nvim/plugged')
    Plug 'ianks/gruvbox'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    Plug 'lervag/vimtex'
call plug#end()
" Fundamental settings
    set fileencoding=utf-8
    set fileformat=unix
    set fileformats=unix,dos,mac
    filetype on
    filetype plugin on
    filetype plugin indent on
    syntax on
" Some useful settings
    set autoindent
    set expandtab   "tab to spaces
    set tabstop=4   "the width of a tab
    set shiftwidth=4    "the width for indent
    set nofoldenable
    set foldmethod=indent   "folding by indent

" Lookings
    set number  "line number
    set relativenumber "use relative numbers
    set nowrap  "no line wrapping
    colorscheme gruvbox "use the theme gruvbox
    set background=dark
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set t_ut=
