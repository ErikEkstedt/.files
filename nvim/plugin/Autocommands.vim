" AUTOCOMMANDS

" Syntax for json comments (jsonc) (coc-vim)
autocmd FileType json syntax match Comment +\/\/.\+$+

" Automatically resize when vim changes
au VimResized * exe "normal! \<c-w>="

" exit quickfix when exiting buffer {{{
" aug qfclose
" 	au!
" 	au winenter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
" aug end "}}}

"----------------------------
" Return to line {{{
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
	au!
	au BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\     execute 'normal! g`"zvzz' |
				\ endif
augroup END " }}}

" LATEX
augroup Latex
	autocmd!
	autocmd BufNewFile,BufRead *.tex set conceallevel=0
	autocmd BufNewFile,BufRead *.tex set norelativenumber
	autocmd BufNewFile,BufRead *.tex setlocal spell! spelllang=en_us
	autocmd BufNewFile,BufRead *.tex set foldmethod=expr
augroup END
