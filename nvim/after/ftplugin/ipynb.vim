setlocal tw=80


" Mappings
nnoremap <localleader>lv :VimpyterStartJupyter

" Slimux
nnoremap <buffer> <CR> vip:SlimuxREPLSendLine<CR> 
vnoremap <buffer> <CR> :SlimuxREPLSendLine<CR>gv<Esc>zz

" Get both markdown and html snippets
:UltiSnipsAddFiletypes python.markdown.ipynb
