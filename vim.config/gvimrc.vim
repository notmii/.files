if has("gui_running")
    " ======= GUI Vim ===================
    set guioptions-=m           " Remove menu bar
    set guioptions-=T           " Remove toolbar
    set guioptions-=r           " Remove right-hand scroll bar
    set guioptions-=l           " Remove left-hand scroll bar
    set guioptions-=b           " Remove horizontal scroll bar
    set guifont=Source\ Code\ Pro\ 9
    set mouse=n

    Plugin 'https://github.com/Shougo/vimshell.vim.git'
    Plugin 'https://github.com/Shougo/vimproc.vim.git'
endif
