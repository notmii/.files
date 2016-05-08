let g:ctrlp_map                     = '<c-p>'
let g:ctrlp_regexp                  = 1
let g:ctrlp_match_window_bottom     = 1
let g:ctrlp_open_new_file           = 't'
let g:ctrlp_open_multiple_files     = 'tjr'
" let g:ctrlp_match_func              = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update             = 1

if executable('ag')
    let g:ctrlp_user_command = 'ag %s --ignore-case --nocolor --nogroup -g ""'
endif

if system('git rev-parse --is-inside-work-tree') =~ 'true'
  let g:ctrlp_user_command = 'cd %s && git ls-files'
endif
