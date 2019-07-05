" setlocal syntax off

" jump to links with CR
nnoremap <buffer> <CR> <C-]>
" jump back with BS
nnoremap <buffer> <BS> <C-T>
" skip to next option link
nnoremap <silent><buffer> o /'[a-z]\{2,\}'<CR>
" skip to previous option link
nnoremap <silent><buffer> O ?'[a-z]\{2,\}'<CR>
" skip to next subject link
nnoremap <silent><buffer> s /\|\S\+\|<CR>l
" skip to previous subject link
nnoremap <silent><buffer> S h?\|\S\+\|<CR>l
" quit
nnoremap <silent><buffer> q :q<CR>

setlocal nospell
