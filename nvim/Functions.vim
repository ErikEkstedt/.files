" vim: fdm=marker
" FUNCTIONS 

function! NERDTreeColors() "{{{
	hi NERDTreeDir guifg=#90a959 
	hi Directory guifg=#404040
	hi NERDTreeCWD guifg=gray50
	hi NERDTreeFile guifg=white
	hi NERDTreeBookmarksHeader guifg=gray50
	hi NERDTreeBookmarkName guifg=gray50
endfunc
nnoremap <LocalLeader>n :call NERDTreeColors()<CR>
"}}}

" Moving visual lines vertically (greg hurrell){{{
function! s:Visual()
	return visualmode() == 'V'
endfunction

function! Move_up() abort range
	let l:at_top=a:firstline == 1
	if s:Visual() && !l:at_top
		'<,'>move '<-2
		call feedkeys('gv=','n')
	endif
	call feedkeys('gv','n')
endfunction

function! Move_down() abort range
	let l:at_bottom=a:lastline == line('$')
	if s:Visual() && !l:at_bottom
		'<,'>move '>+1
		call feedkeys('gv=','n')
	endif
	call feedkeys('gv','n')
endfunction

xnoremap K :call Move_up()<CR>
xnoremap J :call Move_down()<CR>
"}}}

function! s:ShowMaps() "{{{
	let old_reg = getreg("a")          " save the current content of register a
	let old_reg_type = getregtype("a") " save the type of the register as well
	try
		redir @a                           " redirect output to register a
		" Get the list of all key mappings silently, satisfy "Press ENTER to continue"
		silent verbose map | call feedkeys("\<CR>")    
		redir END                          " end output redirection
		vnew                               " new buffer in vertical window
		put a                              " put content of register
		" Sort on 4th character column which is the key(s)
		%!sort -k1.4,1.4
	finally                              " Execute even if exception is raised
		call setreg("a", old_reg, old_reg_type) " restore register a
	endtry
endfunction
com! ShowMaps call s:ShowMaps()      " Enable :ShowMaps to call the function

nnoremap \m :ShowMaps<CR>            " Map keys to call the function }}}
