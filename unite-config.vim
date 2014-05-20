let g:unite_update_time = 100
let g:unite_enable_start_insert = 1
let g:unite_winheight = 20
let g:unite_source_rec_max_cache_files = 1000000

let g:unite_source_rec_async_command    = 'noglob find -name *|grep -v "public/\(build\|tests\)"|grep -v ".min.js\$"'
let g:unite_source_find_command         = 'noglob find -name *|grep -v "public/\(build\|tests\)"|grep -v ".min.js\$"'


