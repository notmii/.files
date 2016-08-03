" ======= MAPPINGS ================
let mapleader=','
nnoremap <silent> <C-e> :bprevious\|bdelete #<CR>
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprevious<CR>
noremap <silent> <C-j> :call smooth_scroll#down(5, 0, 5)<CR>
noremap <silent> <C-k> :call smooth_scroll#up(5, 0, 5)<CR>
noremap <silent> <C-PageUp> :tabnext<CR>
noremap <silent> <C-PageDown> :tabprevious<CR>

noremap ; :
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
vnoremap y y :call system('xclip -sel clip -i', @0)<CR>
noremap yy yy :call system('xclip -sel clip -i', @0)<CR>
noremap <silent> <F4> :TagbarToggle<CR>

nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
nnoremap <c-\> :CtrlPBuffer<cr>
vnoremap <c-\> :CtrlPBuffer<cr>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ neosnippet#mappings#expand_or_jump_impl() :
    \ pumvisible() ? "\<Down>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ neosnippet#mappings#expand_or_jump_impl() :
    \ pumvisible() ? "\<Down>" : "\<TAB>"

inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<TAB>"
