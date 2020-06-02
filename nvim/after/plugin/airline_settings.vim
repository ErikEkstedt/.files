if exists('g:loaded_airline')
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
