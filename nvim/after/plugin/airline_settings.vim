if !exists('g:loaded_airline')
  finish
endif

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

if exists('g:did_coc_loaded')
  let g:airline#extensions#coc#enabled = 1
  let g:airline_section_x = airline#section#create(['%-0.40{coc#status()}'])
  let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
  let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'

  " Change warning/error symbol/format:
  let airline#extensions#coc#error_symbol = 'E:'
  let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
  let airline#extensions#coc#warning_symbol = 'W:'
  let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
endif


function s:UpdateAirline()
  if g:colors_name =~ 'wombat'
    let g:airline_theme='wombat'
  elseif g:colors_name =~ 'onedark'
    let g:airline_theme='onedark'
  elseif g:colors_name =~ 'gruvbox'
    let g:airline_theme='gruvbox'
  elseif g:colors_name =~ 'nord'
    let g:airline_theme='nord'
  endif
  normal! :AirlineRefresh<cr>
endfunction


augroup AirlineUpdate 
  autocmd!
  autocmd ColorScheme * call s:UpdateAirline()
augroup END 
