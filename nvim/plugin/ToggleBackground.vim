" TransparentBackground
let g:transparent_background = 0
function! TransparentBackground ()  " {{{
	if g:transparent_background 
		let g:transparent_background = 0
		execute 'colorscheme' g:colors_name
	else
		let g:transparent_background = 1
		hi Normal guibg=#000000
		hi Folded guibg=#000000
		hi LineNr guibg=#000000
		hi SignColumn guibg=#000000
		hi GitGutter guibg=#000000
		hi GitGutterAdd guibg=#000000
		hi GitGutterChange guibg=#000000
	endif
endfunc "}}}
nnoremap <C-t> :call TransparentBackground()<CR>
