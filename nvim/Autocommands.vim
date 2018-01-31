" AUTOCOMMANDS 
" exit quickfix when exiting buffer {{{
aug qfclose 
	au!
	au winenter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug end "}}}

" set .conf files as dosini 
autocmd BufRead,BufNewFile *.conf setf dosini

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

