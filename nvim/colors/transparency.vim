" TransparentBackground


let g:transparent_background = 0
function! TransparentBackground ()  " {{{
  if g:transparent_background 
    let g:transparent_background = 0
    execute 'colorscheme ' . g:colors_name
    hi link EndOfBuffer ColorColumn
    set cursorline

  else
    let g:transparent_background = 1
    hi Normal guibg=NONE
    hi Folded guibg=NONE
    hi LineNr guibg=NONE
    hi Conceal guibg=NONE
    hi SignColumn guibg=NONE
    hi GitGutter guibg=NONE
    hi GitGutterAdd guibg=NONE
    hi GitGutterChange guibg=NONE
    hi GitGutterChangeDelete guibg=NONE
    hi GitGutterDelete guibg=NONE
    hi ColorColumn guibg=NONE
    hi EndOfBuffer guibg=NONE
    hi CursorLine guibg=NONE
    hi CursorLineNr guibg=NONE
    hi StatusLine guibg=NONE
    hi StatusLineNC guibg=NONE
    hi EndOfBuffer guibg=NONE

    " Airline
    " How to save highlight as variables?
    " let g:airline_tabfill_prev = airline_tabfill guibg=NONE
    " leg g:airline_c_prev = airline_c
    hi airline_tabfill guibg=NONE
    hi airline_c guibg=None

    set nocursorline
  endif
endfunc "}}}
