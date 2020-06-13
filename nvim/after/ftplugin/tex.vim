" lattex ftplugin
setlocal tw=0    " Don't break lines by default
set wrapmargin=0 " Don't break lines by default
set wrap         " Wrap lines

nmap <space>c <plug>(vimtex-view)
nmap <space><S-C> <Plug>(vimtex-compile)

" noremap <space>c :VimtexView<CR>
" nmap <space><S-C> <Plug>(vimtex-compile)

" augroup Latex
"   autocmd!
"   autocmd BufNewFile,BufRead *.tex set conceallevel=0
"   autocmd BufNewFile,BufRead *.tex set norelativenumber
"   autocmd BufNewFile,BufRead *.tex setlocal spell! spelllang=en_us
"   autocmd BufNewFile,BufRead *.tex set foldmethod=expr
" augroup END
