
" jump to next tag
nnoremap <silent><buffer> zj
  \ :call search('<Bar>[^ <Bar>]\+<Bar>\<Bar>''[A-Za-z0-9_-]\{2,}''')<cr>

" jump to previous tag
nnoremap <silent><buffer> zk
 \ :call search('<Bar>[^ <Bar>]\+<Bar>\<Bar>''[A-Za-z0-9_-]\{2,}''','b')<cr>

" Why is help slow?
" :au bufenter 
" :au winenter 
" setlocal syntax off

" jump to links with CR
nmap <buffer> <CR> <C-]>
" jump back with BS
nmap <buffer> <BS> <C-T>
" skip to next option link
nmap <buffer> o /'[a-z]\{2,\}'<CR>
" skip to previous option link
nmap <buffer> O ?'[a-z]\{2,\}'<CR>
" skip to next subject link
nmap <buffer> s /\|\S\+\|<CR>l
" skip to previous subject link
nmap <buffer> S h?\|\S\+\|<CR>l
" quit
nmap <buffer> q :q<CR>


setlocal nospell
