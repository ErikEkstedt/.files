if exists('g:did_coc_loaded')
  let g:airline#extensions#coc#enabled = 1
  let g:airline_section_x = airline#section#create(['%{coc#status()}'])
  let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
  let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

  " Change error symbol:
  let airline#extensions#coc#error_symbol = 'E:'

  " Change warning symbol:
  let airline#extensions#coc#error_symbol = 'W:'

  " Change error format:
  let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

  " Change warning format:
  let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
endif

