" ======= Theme Settings ============
set term=xterm-256color     " [ builtin_xterm | xterm-256color ]
set nocursorcolumn
set nocursorline
colorscheme molokai
syntax enable
hi normal       ctermbg=none
hi Pmenu        ctermbg=black       ctermfg=white
hi PmenuSel     ctermbg=grey        ctermfg=black
hi Search       ctermfg=15          ctermbg=8
hi NonText      ctermfg=none        cterm=none
hi CursorLine   ctermbg=none        cterm=underline
hi CursorColumn ctermbg=236

" Fix vim's background when running on tmux website: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
    set t_ut=
    set t_Co=256
endif


" ======= Personal Settings ========
set number          " Show line number
set mouse=c         " Enable mouse interaction
set hlsearch        " Highlight search
set incsearch       " Search as you type
set ignorecase      " Ignore case in searching
set smartcase       " When search starts with capital letter do case sensitive search
set splitright      " Open split window on the right of current pane
set splitbelow      " Open split window on the bottom of current pane

set smarttab
set expandtab       " Use space instead of tab
set tabstop=4       " Size of tab
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set hidden

set showcmd                 " Show the command being type
set nowrap                  " Set to no wrapping
set linebreak               " Wrap lines on convenient points
set backspace=indent,eol,start

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
