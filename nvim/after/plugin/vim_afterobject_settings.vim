" vim-after-object

if !exists('g:loaded_after_object')
  finish
endif

autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '+', '*', '{', ']', '}')
