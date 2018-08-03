" AUTOCOMMANDS

" Automatically resize when vim changes 
au VimResized * exe "normal! \<c-w>="

" exit quickfix when exiting buffer {{{
aug qfclose
	au!
	au winenter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug end "}}}

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

augroup CursorLine
	au!
	au VimEnter * setlocal cursorline
	au WinEnter * setlocal cursorline
	au BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" LATEX
augroup Latex
	autocmd!
	autocmd BufNewFile,BufRead *.tex set conceallevel=0
	autocmd BufNewFile,BufRead *.tex set norelativenumber
	autocmd BufNewFile,BufRead *.tex setlocal spell! spelllang=en_us
	autocmd BufNewFile,BufRead *.tex set foldmethod=expr
augroup END

augroup html
	autocmd!
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> p  <p>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> h1 <h1>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> h2 <h2>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> h4 <h3>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> h6 <h4>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> div <div>
augroup END
