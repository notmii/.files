let g:syntastic_javascript_checkers = ['eslint']

if executable('eslint_d')
    let g:syntastic_javascript_eslint_exec = 'eslint_d'
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
