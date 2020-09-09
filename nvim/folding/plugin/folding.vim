if exists('g:folding_loaded')
  finish
endif
let g:folding_loaded = 1


set foldtext=folding#foldtext()
