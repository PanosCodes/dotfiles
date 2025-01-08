set nocompatible               " be iMproved
set clipboard^=unnamed

" 1 tab to 2 space for ruby
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" number line show
set nu

set noswapfile
"in order to switch between buffers with unsaved change
set hidden

" cancel shift+k bind
map <S-k> <Nop>

" hightlight column and line
set cursorline
"set cursorcolumn
filetype plugin indent on
syntax on
nmap vv ^vg_

