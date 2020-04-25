" Airline settings

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='onedark'
" let g:airline_theme='wombat'
" let g:airline_theme='nord'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''


" Use tabline for opened buffers
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#disable_rtp_load = 1


" Sections in statusline
" [A: Mode] [B: Git] [C: fname] [X: filetype] [Y: encoding ] [Z: current position] [warnings/errors/statistics]

let g:airline#extensions#coc#enabled = 1
let g:airline_section_c = airline#section#create(['%f'])
let g:airline_section_x = airline#section#create(['%-0.40{coc#status()}'])
let g:airline_section_y = airline#section#create(['filetype'])
let g:airline_section_z = airline#section#create([''])

" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Change error symbol & Change error format:
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

" Change warning symbol & Change warning format:
let airline#extensions#coc#error_symbol = 'W:'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
