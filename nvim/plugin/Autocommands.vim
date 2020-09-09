" AUTOCOMMANDS

" Syntax for json comments (jsonc) (coc-vim)
autocmd FileType json syntax match Comment +\/\/.\+$+


" Syntax for Dockerfile (Dockerfile.WHATEVER)
autocmd BufNewFile,BufRead Dockerfile* set syntax=dockerfile


" exit quickfix when exiting buffer {{{
" aug qfclose
" 	au!
" 	au winenter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
" aug end "}}}
