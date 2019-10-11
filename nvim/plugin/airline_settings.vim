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

" " if you want to disable auto detect, comment out those two lines
let g:airline#extensions#coc#enabled = 1
let g:airline_section_x = airline#section#create(['%{coc#status()}'])
let g:airline_section_y = airline#section#create(['%{fugitive#statusline()}'])
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" " Change error symbol:
let airline#extensions#coc#error_symbol = 'Error:'

" " Change warning symbol:
let airline#extensions#coc#error_symbol = 'Warning:'

" " Change error format:
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

" " Change warning format:
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
