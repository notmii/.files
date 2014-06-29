exec 'set runtimepath+=' . g:VIMRC_BASE_URL . '/vim/bundle/Vundle.vim'
call vundle#begin()

" Productivity plugins
Plugin 'https://github.com/jiangmiao/auto-pairs.git'
Plugin 'https://github.com/Lokaltog/vim-easymotion.git'
Plugin 'https://github.com/vim-scripts/HTML-AutoCloseTag.git'
Plugin 'https://github.com/vim-scripts/matchit.zip.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/Shougo/neosnippet.vim.git'
" Plugin 'https://github.com/Shougo/neocomplcache.vim.git'

" Utility plugins
Plugin 'https://github.com/gmarik/Vundle.vim.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/jistr/vim-nerdtree-tabs.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/mhinz/vim-signify.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/terryma/vim-smooth-scroll.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/elzr/vim-json.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/xolox/vim-easytags.git'
Plugin 'https://github.com/tpope/vim-dispatch.git'

" PHP plugins
" Plugin 'https://github.com/spf13/PIV.git'
" Plugin 'https://github.com/shawncplus/phpcomplete.vim.git'
" Plugin 'https://github.com/m2mdas/phpcomplete-extended.git'

" C# Plugins
Plugin 'https://github.com/nosami/Omnisharp.git'

" Python plugins
" Plugin 'https://github.com/davidhalter/jedi-vim.git'

call vundle#end()
