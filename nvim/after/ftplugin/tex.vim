" lattex ftplugin
setlocal tw=80

nmap <space>c <plug>(vimtex-view)
" noremap <space>c :VimtexView<CR>

" echo 'hello vimtex mappings!'
nmap ,tt <plug>(vimtex-compile-toggle)
