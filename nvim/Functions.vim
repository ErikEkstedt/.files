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
