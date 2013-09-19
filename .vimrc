set nocompatible

execute pathogen#infect()
call pathogen#helptags()
call pathogen#incubate()

" ======= Power Line Settings =======
" let g:Powerline_symbols = 'fancy'
set laststatus=2
set term=xterm-256color     " [ builtin_xterm | xterm-256color ]

" ====== Theme Settings ============
colorscheme desert
syntax enable
filetype plugin on
filetype indent on

" ======= Personal Settings ========
set number          " Show line number
set mouse=n         " Enable mouse interaction
set hlsearch        " Highlight search
set incsearch       " Search as you type
hi Search cterm=bold ctermfg=black ctermbg=yellow

set expandtab       " Use space instead of tab
set tabstop=4       " Size of tab
set smarttab
set softtabstop=4
set shiftwidth=4
set autoindent

set showcmd                 " Show the command being type
set clipboard=unnamedplus   " Set the clipboard as the default storage of copy
set nowrap                  " Set to no wrapping
set linebreak               " Wrap lines on convenient points
set backspace=indent,eol,start

set list
set listchars=tab:>>,trail:$,extends:#,nbsp:$
set pastetoggle=<F2>

set wildmenu
set title
set history=1000
set undolevels=1000

" ======= Mappings ================
map <C-j> :tabnext<CR>
map <C-k> :tabprevious<CR>
map <C-t> :tabnew<CR>
map <C-w> :tabclose<CR>
map <C-a> ggvGG
nnoremap ; :
nnoremap j gj
nnoremap k gk

" ======= Corssaire Mode ==========
set cursorline
set cursorcolumn
highlight CursorColumn  ctermbg=236
highlight CursorLine    cterm=none ctermbg=236

" ======= Corssaire Mode ==========
set cursorcolumn
set cursorline

highlight CursorLine        ctermbg=236 cterm=none
highlight CursorColumn      ctermbg=236

" ======= PHP Linting ========
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" ======= Code Folding =======
set foldmarker={,}
set foldmethod=marker
set foldcolumn=5

" ======= Quick List 'Vim Searching' ========
set grepprg=grep\ -rns\ --exclude=tags\ --exclude-dir=\"public\/build\"
set grepformat=%f:%l:%m
" nnoremap <C-f> :execute 'grep '  input("Find:")  ' .'<cr>

" ====== NEO Complete with cache and Autocomplete setting =============
let g:neocomplcache_enable_at_startup = 1
set omnifunc=syntaxcomplete#Complete
set complete=.,i,t
set completeopt=longest,menuone
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
cs add /home/john/Projects/gaf-cvs/cscope.out
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" ====== Execute Commands on file Open =======
if !exists("autocommand_loaded")
    let autocommand_loaded = 1
endif

" ====== CtrlP ===============================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmp = '<CtrlPMixed>'
let g:ctrlp_user_command = 'find %s -type f'

" ====== Taglist (Tlist) =====================
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let tlist_php_settings='php;c:class;f:function'

source ~/.vimrc-xdebug
