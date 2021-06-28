call plug#begin('~/.local/share/nvim/site/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    
    " File Explorer
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    Plug 'vim-airline/vim-airline'

    " Python Linting & Fixing
    Plug 'dense-analysis/ale'

    " Python
    Plug 'klen/python-mode'

    Plug 'tpope/vim-sensible'
    Plug 'scrooloose/syntastic'
    Plug 'nvie/vim-flake8'
    Plug 'ervandew/supertab'
    Plug 'sirver/ultisnips'
    Plug 'preservim/nerdcommenter'

call plug#end()
