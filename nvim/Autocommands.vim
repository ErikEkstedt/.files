" AUTOCOMMANDS 
" exit quickfix when exiting buffer {{{
aug qfclose 
	au!
	au winenter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug end "}}}

" set .conf files as dosini 
autocmd BufRead,BufNewFile *.conf setf dosini

" cleanup vimtex on quit {{{ 
augroup vimtex_event_1
	au!
	au user vimtexeventquit call vimtex#compiler#clean(0)
augroup end "}}}


" Return to line {{{
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END " }}}
