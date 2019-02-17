" AUTOCOMMANDS

" Syntax for json comments (jsonc) (coc-vim)
autocmd FileType json syntax match Comment +\/\/.\+$+

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

" LATEX
augroup Latex
	autocmd!
	autocmd BufNewFile,BufRead *.tex set conceallevel=0
	autocmd BufNewFile,BufRead *.tex set norelativenumber
	autocmd BufNewFile,BufRead *.tex setlocal spell! spelllang=en_us
	autocmd BufNewFile,BufRead *.tex set foldmethod=expr
augroup END


" FOCUS
" Greg Hurrell:
" https://github.com/wincent/wincent/blob/2aa44544fe9e8fc466fea42391e66fff3583054c/roles/dotfiles/files/.vim/plugin/autocmds.vim

let g:ColorColumnBlacklist = ['diff', 'undotree', 'help', 'qf']
let g:CursorlineBlacklist = ['fzf', 'nerdtree', 'help']

function! Should_colorcolumn() abort
  return index(g:ColorColumnBlacklist, &filetype) == -1
endfunction

function! Should_cursorline() abort
	return index(g:CursorlineBlacklist, &filetype) == -1
endfunction

autocmd InsertLeave,VimEnter,WinEnter * if Should_cursorline() | setlocal cursorline relativenumber | endif
autocmd WinLeave * if Should_cursorline() | setlocal nocursorline norelativenumber | endif

" Make current window more obvious by turning off/adjusting some features in non-current windows.
if exists('+colorcolumn')
	" autocmd BufEnter,FocusGained,VimEnter,WinEnter * if Should_colorcolumn() | let &l:colorcolumn='+' . join(range(0, 254), ',+') | endif
	autocmd BufEnter,FocusGained,VimEnter,WinEnter * if Should_colorcolumn() | let &l:colorcolumn='+0' | endif
	autocmd FocusLost,BufLeave,WinLeave * if Should_colorcolumn() | let &l:colorcolumn=join(range(1, 255), ',') | endif
endif

" Help colorcolumn
" :set cc=+1  " highlight column after 'textwidth'
" :set cc=+1,+2,+3  " highlight three columns after 'textwidth'
" :hi ColorColumn ctermbg=lightgrey guibg=lightgrey
