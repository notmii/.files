set nocompatible

call pathogen#helptags()
call pathogen#incubate()
execute pathogen#infect()

" ======= GUI Vim ===================
set guioptions-=m           " Remove menu bar
set guioptions-=T           " Remove toolbar
set guioptions-=r           " Remove right-hand scroll bar
set guifont=Monospace\ 7

" ======= Power Line Settings =======
" let g:Powerline_symbols = 'fancy'
set laststatus=2
set term=xterm-256color     " [ builtin_xterm | xterm-256color ]

" ====== Theme Settings ============
colorscheme desert
syntax enable
filetype plugin indent on

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
set backspace=indent,eol,start
set list
set listchars=tab:>>,trail:$,extends:#,nbsp:$
set pastetoggle=<F2>

set wildmenu
set title
set history=1000
set undolevels=1000

" ======= Mappings ================
map <silent> <C-l> :tabnext<CR>
map <silent> <C-h> :tabprevious<CR>
map <silent> <C-t> :tabnew<CR>
" map <silent> <C-w> :tabclose!<CR>
map <silent> <C-a> ggvGG
nnoremap ; :
map j gj
map k gk

" ======= Crossaire Mode ==========
set cursorline
set cursorcolumn
highlight CursorColumn  ctermbg=236
highlight CursorLine    cterm=none ctermbg=236

" ======= PHP Linting ========
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" ======= Code Folding =======
set foldmarker={,}
set foldmethod=marker
set foldcolumn=5

" ======= Quick List 'Vim Searching' ========
set grepprg=grep\ -rns\ -C\ 1\ --exclude=tags\ --exclude-dir=\"public\/build\"\ $*
set grepformat=%f:%l:%m
map <silent> <C-f> :call g:WordFind()<CR>

function! g:WordFind()
    let l:pattern = input("Find:")

    if l:pattern == ''
        return
    endif

    let l:grepCommand = 'grep -rns -C 1 --exclude=tags --exclude-dir=public/build "' . l:pattern . '" .'
    let l:commandOutput = system(l:grepCommand)

    " Output to file
    exe 'redir! > ./temp'
    silent echon l:commandOutput
    let @/ = l:pattern
    redir END


    let oldefm = &efm
    set efm=%f:%\\s%#%l:%m
    execute 'silent! cgetfile ./temp'
    :copen
    let &efm = oldefm
    " call delete('./temp')
endfunction

" ====== NEO Complete with cache and Autocomplete setting =============
let g:neocomplcache_enable_at_startup = 1
set omnifunc=syntaxcomplete#Complete
set complete=.,i,t
set completeopt=longest,menuone
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" ====== Execute Commands on file Open =======
if !exists("autocommand_loaded")
    let autocommand_loaded = 1
endif
