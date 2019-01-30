function! ChangeBackground(bg_color)
  let l:bg_color='#' . string(a:bg_color)
  exe 'hi! StatusLine guibg=' . l:bg_color
  exe 'hi! Normal guibg=' . l:bg_color
  exe 'hi! LineNr guibg=' . l:bg_color
  exe 'hi! Folded guibg=' . l:bg_color
endfunc
