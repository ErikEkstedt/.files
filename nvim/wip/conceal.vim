:help conceal
:help matchadd()

" Example: 
:highlight MyGroup ctermbg=green guibg=green
:let m = matchadd("MyGroup", "<strong>")

" Deletion of the pattern:
:call matchdelete(m)


" Example:

:syntax match Entity "\<strong\>" conceal cchar=**

" See |hl-Conceal| for highlighting.
" look inst vim-polyglot and see how it works in practice.
