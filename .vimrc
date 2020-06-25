set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'ekalinin/Dockerfile.vim'
    Plugin 'morhetz/gruvbox'
    Plugin 'majutsushi/tagbar'
    Plugin 'powerline/powerline'
call vundle#end()
"required
" Fundamentals
    filetype plugin indent on    " required
    filetype indent on
    syntax enable  "Enable filtype specific syntaxhighlighting
"Lookings
    set termguicolors
    set t_ut=      "Workaround for Background color erase error
    colorscheme gruvbox
    set background=dark
    let g:gruvbox_contrast='hard'
    set number     "Show line numbers
"Editing
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab         "Replace tab with spaces/see filtype indent on for compatability with Makefile
    set autoindent
    set nofoldenable      "Do not start with closed folds
    set foldmethod=indent "Folding by indent
