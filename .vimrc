" Pathogen - vim plugin manager
execute pathogen#infect() 

" ======= Power Line Settings =======
" let g:Powerline_symbols = 'fancy'
set laststatus=2
set term=xterm-256color     " [ builtin_xterm | xterm-256color ]

" ====== Theme Settings ============
syntax enable
filetype plugin on
colorscheme desert 

" ======= Personal Settings ========
set number          " Show line number
set mouse=a		    " Enable mouse interaction
set hlsearch        " Highlight search

set expandtab		" Use space instead of tab
set tabstop=4		" Size of tab
set softtabstop=4
set shiftwidth=4
set autoindent

set showcmd                 " Show the command being type
set clipboard=unnamedplus   " Set the clipboard as the default storage of copy
set nowrap                  " Set to no wrapping

" ======= PHP Linting ========
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" ======= Code Folding =======
set foldmethod=indent
set foldcolumn=2


" ====== Execute Commands on file Open =======
if !exists("autocommand_loaded")
    let autocommand_loaded = 1
endif
