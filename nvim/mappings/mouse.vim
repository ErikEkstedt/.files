" <2-LeftMouse>     Open fold, or select word or % match.
nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
