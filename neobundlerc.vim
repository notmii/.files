exec 'call neobundle#rc(expand("' . g:VIMRC_BASE_URL . '/vim/bundle/"))'

NeoBundleFetch 'https://github.com/Shougo/neobundle.vim.git'
NeoBundleFetch 'https://github.com/Shougo/neocomplete.vim.git'
NeoBundleFetch 'https://github.com/Shougo/neosnippet.vim.git'
NeoBundleFetch 'https://github.com/Shougo/unite.vim.git'

NeoBundleFetch 'https://github.com/Shougo/vimproc.vim.git', {
\   'build' : {
\       'windows' :  'make -f make_mingw32.mak',
\       'cygwin' :   'make -f make_cygwin.mak',
\       'mac' :      'make -f make_mac.mak',
\       'unix' :     'make -f make_unix.mak',
\    }
\}

NeoBundleFetch 'https://github.com/kien/ctrlp.vim.git'
NeoBundleFetch 'https://github.com/Raimondi/delimitMate.git'
NeoBundleFetch 'https://github.com/scrooloose/nerdtree.git'
NeoBundleFetch 'https://github.com/jistr/vim-nerdtree-tabs.git'
NeoBundleFetch 'https://github.com/scrooloose/syntastic.git'
NeoBundleFetch 'https://github.com/tpope/vim-fugitive.git'
NeoBundleFetch 'https://github.com/terryma/vim-smooth-scroll.git'
" NeoBundleFetch 'https://github.com/shawncplus/phpcomplete.vim.git'
" NeoBundleFetch 'https://github.com/m2mdas/phpcomplete-extended.git'

NeoBundleFetch 'https://github.com/bling/vim-airline.git'
NeoBundleFetch 'https://github.com/mhinz/vim-signify.git'
NeoBundleFetch 'https://github.com/spf13/PIV.git'
NeoBundleFetch 'https://github.com/vim-scripts/HTML-AutoCloseTag.git'
NeoBundleFetch 'https://github.com/vim-scripts/matchit.zip.git'
NeoBundleFetch 'https://github.com/Lokaltog/vim-easymotion.git'
NeoBundleFetch 'https://github.com/tpope/vim-surround.git'

NeoBundleCheck
