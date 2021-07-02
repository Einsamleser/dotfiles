source $HOME/.local/share/nvim/site/autoload/vim-plug/plugins.vim

let g:powerline_pycmd="py3"

filetype plugin on
set nocompatible
autocmd FileType python set breakindentopt=shift:4

syntax on
set encoding=utf-8
set modelines=0
set number
set relativenumber
set ruler
set visualbell
set noswapfile
set backspace=indent,eol,start

set wrap
set textwidth=79
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set fileformat=unix


set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

autocmd BufNewFile *.sh,*.py exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"#!/usr/bin/zsh")
        call append(line("."), "")
    else
        call setline(1,"#!/usr/bin/python")
        call append(line("."),"# conding: utf-8")
        call append(line(".")+1, "")
    endif
endfunc
