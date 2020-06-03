if !exists('g:loaded_delimitMate')
  finish
endif

imap <expr> <CR> pumvisible() ? "\<C-Y>": "<Plug>delimitMateCR"

let delimitMate_expand_cr = 1
