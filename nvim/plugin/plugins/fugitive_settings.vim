" Fugitive

" Mappings
" Same mappings as aliases in zsh
" <leader> is a prefix
nnoremap <Leader>gst :Gstatus<CR>
nnoremap <Leader>gad :Gwrite<CR>
nnoremap <Leader>gco :Gcommit<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gpl :Gpull<CR>

nnoremap <Leader>gcc :Gwrite<CR>:Gcommit<CR>

"  Clue 1.  * automerge diff track.  <<<<<<< 
nnoremap <Leader>gdi  /<<<<<<<<CR>n<C-o>zz
