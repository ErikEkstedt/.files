nnoremap <silent> gd :<C-u>call OniCommand("language.gotoDefinition")<CR>


tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l

" nnoremap <silent><A-h> :<C-u>call OniNextWindow('h')<CR>
" nnoremap <silent><A-j> :<C-u>call OniNextWindow('j')<CR>
" nnoremap <silent><A-k> :<C-u>call OniNextWindow('k')<CR>
" nnoremap <silent><A-l> :<C-u>call OniNextWindow('l')<CR>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
