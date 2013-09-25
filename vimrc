set nocompatible

call pathogen#helptags()
call pathogen#incubate()
execute pathogen#infect()

set omnifunc=syntaxcomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_cache_taglists = 1
let php_sql_query=1
let php_htmlInStrings=1

let g:acp_enableAtStartup = 1
let g:acp_completeOption = '.,t,i'
let g:acp_completeoptPreview = 1
let g:acp_behaviorKeywordCommand = "\<C-n>"

inoremap <expr> <TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

let g:necomplcache_enable_at_startup = 1
let g:necomplcache_enable_smart_case = 1
let g:necomplcache_min_syntax_length = 2
let g:neocomplcache_enable_auto_select = 0

let g:ctrlp_regexp = 1
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tjr'


" ======= GUI Vim ===================
set guioptions-=m           " Remove menu bar
set guioptions-=T           " Remove toolbar
set guioptions-=r           " Remove right-hand scroll bar
set guifont=Monospace\ 7

" ======= Power Line Settings =======
" let g:Powerline_symbols = 'fancy'
set laststatus=2
set term=xterm-256color     " [ builtin_xterm | xterm-256color ]

" ======= Theme Settings ============
colorscheme desert
syntax enable
filetype plugin indent on
hi Pmenu        ctermbg=black       ctermfg=white
hi PmenuSel     ctermbg=grey        ctermfg=black
hi Search       cterm=bold          ctermfg=black ctermbg=yellow

" ======= Personal Settings ========
set number          " Show line number
set mouse=n         " Enable mouse interaction

set hlsearch        " Highlight search
set incsearch       " Search as you type

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
set dir=~/.vim/sessions//

" ======= Mappings ================
map <silent> <C-l> :tabnext<CR>
map <silent> <C-h> :tabprevious<CR>
map <silent> <C-t> :tabnew<CR>
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
    let l:pattern = input("FindWord:")

    if l:pattern == ''
        return
    endif

    let l:grepCommand = 'egrep -rns -C 2 --exclude=tags --exclude-dir=public/build "' . l:pattern . '" . > /tmp/grep-temp'
    call system(l:grepCommand)

    let oldefm = &efm
    set efm=%f:%\\s%#%l:%m
    execute 'silent! cgetfile /tmp/grep-temp'
    :copen
    let &efm = oldefm
    call delete('/tmp/grep-temp')

    let @/ = l:pattern
endfunction

" ====== Execute Commands on file Open =======
if !exists("autocommand_loaded")
    let autocommand_loaded = 1
endif