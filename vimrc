if has("vim_starting")

    set nocompatible
    let g:VIMRC_BASE_URL = resolve(expand('<sfile>:p:h'))

    exec 'set runtimepath+=' . g:VIMRC_BASE_URL . '/vim/bundle/neobundle.vim/'
    exec 'source ' . g:VIMRC_BASE_URL . '/neobundlerc.vim'
    exec 'source ' . g:VIMRC_BASE_URL . '/util-functions.vim'
    exec 'source ' . g:VIMRC_BASE_URL . '/gvimrc.vim'

    call pathogen#infect()
    call pathogen#helptags()
    call pathogen#incubate()
    set completeopt=preview,longest,menuone

    filetype plugin indent on

    au BufNewFile,BufRead *.tpl,*.smarty    set filetype=html
    au BufNewFile,BufRead *.less            set filetype=css
    au filetype css             setlocal omnifunc=csscomplete#CompleteCSS
    au filetype html,markdown   setlocal omnifunc=htmlcomplete#CompleteTags
    au filetype javascript,js   setlocal omnifunc=javascriptcomplete#CompleteJS
    au filetype python          setlocal omnifunc=pythoncomplete#Complete
    au filetype xml             setlocal omnifunc=xmlcomplete#CompleteTags
    au filetype php             call w:phpAutocommand()

    if filereadable('cscope.out')
        cs add cscope.out
    endif

endif



" ====== NEOComplete =======================
let g:neocomplete#enable_at_startup                     = 1
let g:neocomplete#use_vimproc                           = 1
let g:neocomplete#min_keyword_length                    = 2
let g:neocomplete#sources#syntax#min_keyword_length     = 2
let g:neocomplete#enable_prefetch                       = 1

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php   = '[^. \t]->\h\w*\|\h\w*::\|new '
let g:neocomplete#force_omni_input_patterns.php     = '[^. \t]->\h\w*\|\h\w*::\|new '



" ====== NEOSnippet ==========================
let g:neosnippet#enable_preview             = 1

" ====== NERDTree and NERDTreeTabs ===========
let g:nerdtree_tabs_no_startup_for_diff     = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_smart_startup_focus     = 1
let g:nerdtree_tabs_autoclose               = 1
let g:nerdtree_tabs_focus_on_files          = 1
nnoremap <silent> <F3> :NERDTreeTabsToggle<CR>



" ====== CtrlP Settings ======================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmp = '<CtrlPMixed>'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_regexp = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tjr'



" ======= Airline & Status line Settings =====
set laststatus=2
let g:airline_theme="dark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'



" ======= VIM Signify settings ===============
let g:signify_vcs_list = [ 'git' ]
let g:signify_difftool = 'meld'
let g:signify_sign_add               = '+'
let g:signify_sign_change            = '!'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227



" ======= Theme Settings ============
set term=xterm-256color     " [ builtin_xterm | xterm-256color ]
colorscheme molokai
syntax enable
hi normal       ctermbg=232
hi Pmenu        ctermbg=black       ctermfg=white
hi PmenuSel     ctermbg=grey        ctermfg=black
hi Search       ctermfg=black       ctermbg=yellow
hi CursorLine   ctermbg=none        cterm=underline
hi CursorColumn ctermbg=236

" Fix vim's background when running on tmux website: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
    set t_ut=
    set t_Co=256
endif

set cursorcolumn
set cursorline



" ======= Personal Settings ========
set number          " Show line number
set mouse=c         " Enable mouse interaction
set hlsearch        " Highlight search
set incsearch       " Search as you type
set ignorecase      " Ignore case in searching
set smartcase
set splitright      " Open split window on the right of current pane
set splitbelow      " Open split window on the bottom of current pane

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
set backspace=indent,eol,start

if has('unnamedplus')
    set clipboard=unnamedplus   " Set the clipboard as the default storage of copy
else
    set clipboard=unnamed       " Set the clipboard as the default storage of copy
endif

set list                    " Show none-character
set listchars=tab:>>,trail:$,extends:#,nbsp:$
set pastetoggle=<F2>

set wildmenu                    " Show hint on command when tab is pressed
set title
set history=1000
set undolevels=1000
set lazyredraw                  " Buffers the vim motions
set switchbuf+=usetab,newtab    " Open files in quick list in new tab or re-use tab
set pumheight=10                " Autocomplete maximum height



" ======= BackUp Settings =========
set noswapfile
set nobackup
" Sets where vim-session files will be stored
exec 'set dir='.g:VIMRC_BASE_URL.'/sessions/'



" ======= Mappings ================
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-e> :tabclose<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <S-h> :tabmove -1<CR>
nnoremap <silent> <S-l> :tabmove +1<CR>
nnoremap <silent> <C-j> :call smooth_scroll#down(5, 0, 5)<CR>
nnoremap <silent> <C-k> :call smooth_scroll#up(5, 0, 5)<CR>
nnoremap ; :
nnoremap j gj
nnoremap k gk

nnoremap <silent> J :m .+1<CR>
nnoremap <silent> K :m .-2<CR>
inoremap <silent> J <Esc>:m .+1<CR>==gi
inoremap <silent> K <Esc>:m .-2<CR>==gi
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-Space> <C-x><C-o>
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
nnoremap <C-f> :call w:FindWord()<CR>

inoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ neosnippet#mappings#expand_or_jump_impl() :
    \ pumvisible() ? "\<Down>" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ neosnippet#mappings#expand_or_jump_impl() :
    \ pumvisible() ? "\<Down>" : "\<TAB>"

inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<TAB>"
inoremap <expr><Space> pumvisible() ? neocomplete#smart_close_popup() . " " : "\<Space>"
" nmap <C-]>  :exec 'tabe \| tjump! ' . expand('<cword>')<CR>
nmap <C-]> :call w:GoToTag(expand('<cword>'))<CR>
vmap <C-]> :call w:GoToTag(w:GetVisual())<CR>



" ======= Code Folding =======
set foldmarker={,}
set foldmethod=marker
set foldcolumn=5


"   nnoremap <C-]> :call g:GoToDefintion()<CR>
"   function! g:GoToDefintion()
"       tabnew
"       let l:word = expand("<cword>")
"       execute 'tjump '.l:word
"       let @/ = l:word
"   endfunction

" ====== Taglist (Tlist) =====================
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let tlist_php_settings='php;c:class;f:function'

" ====== Project Specific Settings ===========
if filereadable("_vimrc") && has("vim_starting")
    source _vimrc
endif
