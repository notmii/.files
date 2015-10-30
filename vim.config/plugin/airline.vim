" ======= Airline & Status line Settings =====
set laststatus 	    =2
let g:airline_theme ="dark"
let g:airline#extensions#tabline#enabled    = 1
let g:airline#extensions#tabline#fnamemod   = 1
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#branch#enabled     = 1
let g:airline_left_sep          = ''
let g:airline_right_sep         = ''
let g:airline_symbols           = {}
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
