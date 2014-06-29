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



function! s:FindWord()

    let l:pattern = input("FindWord:")

    if l:pattern == ''
        return
    endif

    let @/ = l:pattern
    let l:grepCommand = 'grep -rns -C 2 --exclude=tags --exclude=*.tags --exclude="cscope.*" --exclude-dir=public/build "' . l:pattern . '" . > /tmp/grep-temp'
    call system(l:grepCommand)

    let oldefm = &efm
    set efm=%f:%\\s%#%l:%m
    execute 'silent! cgetfile /tmp/grep-temp'
    :copen
    let &efm = oldefm
    call delete('/tmp/grep-temp')

endfunction



function! s:GoToTag(tagWord)

    let l:tagfile = &tags
    :tabe
    execute 'set tags=' . l:tagfile
    execute ':silent! tjump ' . a:tagWord

    let l:tagFilename = expand('%:t')

    if l:tagFilename == ''
        :tabclose
        :tabprevious
    endif

endfunction



function! s:GetVisual() range
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
endfunction 
