set nocompatible

call pathogen#infect()
call pathogen#helptags()
call pathogen#incubate()

set omnifunc=syntaxcomplete#Complete
set completeopt=preview,longest,menuone


filetype plugin indent on
au BufNewFile,BufRead *.tpl        set filetype=html
au BufNewFile,BufRead *.smarty     set filetype=html
au filetype php set omnifunc=phpcomplete#CompletePHP
" autocmd filetype php set omnifunc=phpcomplete_extended#CompletePHP

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
let g:necomplcache_min_syntax_length = 1
let g:neocomplcache_enable_auto_select = 1

" ====== NERDTree and NERDTreeTabs ===========
let g:nerdtree_tabs_no_startup_for_diff     = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_smart_startup_focus     = 1
let g:nerdtree_tabs_autoclose               = 1
let g:nerdtree_tabs_focus_on_files          = 1
nnoremap <silent> <F3> :NERDTreeTabsToggle<CR>

" ====== CtrlP ===============================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmp = '<CtrlPMixed>'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_regexp = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tjr'

if filereadable('cscope.out')
    cs add cscope.out
endif

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
colorscheme molokai
syntax enable
hi normal       ctermbg=none
hi Pmenu        ctermbg=black       ctermfg=white
hi PmenuSel     ctermbg=grey        ctermfg=black
hi Search       ctermfg=black       ctermbg=yellow
hi CursorLine   ctermbg=236         cterm=none
hi CursorColumn ctermbg=236
hi Normal       ctermbg=none

set cursorcolumn
set cursorline

" ======= Personal Settings ========
set number          " Show line number
set mouse=c         " Enable mouse interaction
set hlsearch        " Highlight search
set incsearch       " Search as you type

set smarttab
set expandtab       " Use space instead of tab
set tabstop=4       " Size of tab
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent

set showcmd                 " Show the command being type
set nowrap                  " Set to no wrapping
set linebreak               " Wrap lines on convenient points
set clipboard=unnamedplus   " Set the clipboard as the default storage of copy
set backspace=indent,eol,start

set list                    " Show none-character
set listchars=tab:>>,trail:$,extends:#,nbsp:$
set pastetoggle=<F2>

set wildmenu                    " Show hint on command when tab is pressed
set title
set history=1000
set undolevels=1000
set dir=~/.vim/sessions//       " Sets where vim-session files will be stored
set lazyredraw                  " Buffers the vim motions
set switchbuf+=usetab,newtab    " Open files in quick list in new tab or re-use tab

" ======= Mappings ================
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-e> :tabclose<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <S-h> :tabmove -1<CR>
nnoremap <silent> <S-l> :tabmove +1<CR>
nnoremap <silent> <C-j> :call smooth_scroll#down(5, 0, 2)<CR>
nnoremap <silent> <C-k> :call smooth_scroll#up(5, 0, 2)<CR>
nnoremap ; :
nnoremap j gj
nnoremap k gk

nnoremap <silent> J :m .+1<CR>
nnoremap <silent> K :m .-2<CR>
inoremap <silent> J <Esc>:m .+1<CR>==gi
inoremap <silent> K <Esc>:m .-2<CR>==gi
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" ======= PHP Linting ========
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" ======= Code Folding =======
set foldmarker={,}
set foldmethod=marker
set foldcolumn=5

map <silent> <C-f> :call g:WordFind()<CR>
function! g:WordFind()
    let l:pattern = input("FindWord:")

    if l:pattern == ''
        return
    endif

    let @/ = l:pattern
    let l:grepCommand = 'egrep -rns -C 2 --exclude=tags --exclude="cscope.*" --exclude-dir=public/build "' . l:pattern . '" . > /tmp/grep-temp'
    call system(l:grepCommand)

    let oldefm = &efm
    set efm=%f:%\\s%#%l:%m
    execute 'silent! cgetfile /tmp/grep-temp'
    :copen
    let &efm = oldefm
    call delete('/tmp/grep-temp')
endfunction

"   nnoremap <C-]> :call g:GoToDefintion()<CR>
"   function! g:GoToDefintion()
"       tabnew
"       let l:word = expand("<cword>")
"       execute 'tjump '.l:word
"       let @/ = l:word
"   endfunction

" ====== Execute Commands on file Open =======
if !exists("autocommand_loaded")
    let autocommand_loaded = 1
endif

" ====== Taglist (Tlist) =====================
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let tlist_php_settings='php;c:class;f:function'

" source ~/.vimrc-xdebug
