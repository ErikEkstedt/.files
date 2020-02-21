" Airline settings

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='onedark'
" let g:airline_theme='nord'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''


let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#disable_rtp_load = 1

let g:airline_section_z = airline#section#create([''])
