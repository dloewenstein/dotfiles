call plug#begin('~/.local/share/nvim/plugged')
    Plug 'ianks/gruvbox'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    Plug 'lervag/vimtex'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-rmarkdown'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
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
    set expandtab                       "tab to spaces
    set tabstop=4                       "the width of a tab
    set shiftwidth=4                    "the width for indent
    set nofoldenable
    set foldmethod=indent               "folding by indent
" Text formatting
    set colorcolumn=79
" Lookings
    set number                          "line number
    set relativenumber                  "use relative numbers
    set showmatch                       "Show matching brackets
    set nowrap                          "no line wrapping
    colorscheme gruvbox                 "use the theme gruvbox
    set background=dark
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set t_ut=
" Setup Netrw
    let g:netrw_banner=0
    let g:netrw_winsize=18
    let g:netrw_liststyle=3
    let g:netrw_altv=1
    let g:netrw_browse_split=4

" Setup vimtex
    let g:vimtex_compiler_programme='nvr'

" Setup fzf-bibtex
   " let $FZF_BIBTEX_CACHEDIR = '/mnt/c/Users/Daniel/CloudStation/Documents/Research/Zotero/'
   let $FZF_BIBTEX_SOURCES = '/mnt/c/Users/Daniel/CloudStation/Documents/Research/Zotero/library.bib'

    function! s:bibtex_cite_sink(lines)
        let r=system("~/go/bin/bibtex-cite ", a:lines)
        execute ':normal! i' . r
    endfunction

    function! s:bibtex_markdown_sink(lines)
        let r=system("~/go/bin/bibtex-markdown ", a:lines)
        execute ':normal! i' . r
    endfunction

    nnoremap <leader>c :call fzf#run({
                \ 'source': '~/go/bin/bibtex-ls',
                \ 'sink*': function('<sid>bibtex_cite_sink'),
                \ 'up': '40%',
                \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

    nnoremap <leader>m :call fzf#run({
                \ 'source': '~/go/bin/bibtex-ls',
                \ 'sink*': function('<sid>bibtex_markdown_sink'),
                \ 'up': '40%',
                \ 'options': '--ansi --layout=reverse-list --multi --prompt "Markdown> "'})<CR>
    function! s:bibtex_cite_sink_insert(lines)
        let r=system("~/go/bin/bibtex-cite ", a:lines)
        execute ':normal! i' . r
        call feedkeys('a', 'n')
    endfunction

    inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
                \ 'source': '~/go/bin/bibtex-ls',
                \ 'sink*': function('<sid>bibtex_cite_sink_insert'),
                \ 'up': '40%',
                \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>
