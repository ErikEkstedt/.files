" TransparentBackground
let g:transparent_background = 0
function! TransparentBackground ()  " {{{
  if g:transparent_background 
    let g:transparent_background = 0
    execute 'colorscheme' g:colors_name
    hi link EndOfBuffer ColorColumn
    set cursorline
  else
    let g:transparent_background = 1
    hi Normal guibg=#000000
    hi Folded guibg=#000000
    hi LineNr guibg=#000000
    hi Conceal guibg=#000000
    hi SignColumn guibg=#000000
    hi GitGutter guibg=#000000
    hi GitGutterAdd guibg=#000000
    hi GitGutterChange guibg=#000000
    hi GitGutterChangeDelete guibg=#000000
    hi GitGutterDelete guibg=#000000
    hi ColorColumn guibg=#000000
    hi EndOfBuffer guibg=#000000
    hi CursorLine guibg=#000000
    hi StatusLine guibg=#000000 guifg=#00deff
    hi StatusLineNC guibg=#000000 guifg=#00a2ba
    hi EndOfBuffer guibg=#000000
    set nocursorline
  endif
endfunc "}}}
nnoremap <C-t> :call TransparentBackground()<CR>
