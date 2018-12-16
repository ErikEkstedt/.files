setlocal fdm=indent
setlocal tw=80


" Note: <CR> is indistinguishable from <C-m>
nnoremap <buffer> <CR> vip:SlimuxREPLSendLine<CR>
vnoremap <buffer> <CR> :SlimuxREPLSendLine<CR>gv<Esc>zz

" delet all lines not containg https

nnoremap <buffer> ,tt ggvG:g!/https/d<CR>
