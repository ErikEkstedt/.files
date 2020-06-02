" Airline settings

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if g:colors_name =~ 'wombat'
  let g:airline_theme='wombat'
elseif g:colors_name =~ 'onedark'
  let g:airline_theme='onedark'
elseif g:colors_name =~ 'gruvbox'
  let g:airline_theme='gruvbox'
elseif g:colors_name =~ 'nord'
  let g:airline_theme='nord'
endif

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
let g:airline_section_y = airline#section#create(['filetype'])
let g:airline_section_z = airline#section#create([''])
