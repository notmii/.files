function! w:phpAutocommand()

    if filereadable('php.tags')
        setlocal tags=php.tags
    endif

    " ======= PHP Linting ========
    setlocal makeprg=php\ -l\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    setlocal omnifunc=phpcomplete#CompletePHP
    let php_sql_query=1
    let php_htmlInStrings=1

endfunction



function! w:FindWord()

    let l:pattern = input("FindWord:")

    if l:pattern == ''
        return
    endif

    let @/ = l:pattern
    let l:grepCommand = 'egrep -rns -C 2 --exclude=tags --exclude=*.tags --exclude="cscope.*" --exclude-dir=public/build "' . l:pattern . '" . > /tmp/grep-temp'
    call system(l:grepCommand)

    let oldefm = &efm
    set efm=%f:%\\s%#%l:%m
    execute 'silent! cgetfile /tmp/grep-temp'
    :copen
    let &efm = oldefm
    call delete('/tmp/grep-temp')

endfunction
