" vim: fdm=marker
" APPEARENCE

" COLORSCHEME 
let g:seoul256_background = 234

" colorscheme seoul256
colorscheme onedark
augroup ColorSchemeGroup "{{{
	  autocmd!
	  autocmd VimEnter,ColorScheme * call ColorPatches()
	  " autocmd VimEnter,ColorScheme * call SyntaxColors()
augroup END ""}}}

function! ColorPatches() "{{{
	if g:colors_name =~ 'seoul256'
		call Seoulpatch()
	elseif g:colors_name =~ 'wombat25mod'
		call Wombat256patch()
	elseif g:colors_name =~ 'base16-monokai'
		call Monokaipatch()
	elseif g:colors_name =~ 'hydrangea'
		call Hydrangeapatch()
	elseif g:colors_name =~ 'onedark'
		call Onedarkpatch()
	endif
endfunc  "}}}

function! Onedarkpatch() "{{{
	call s:set_lightline_colorscheme('myonedark')
endfunc  "}}}

function! Seoulpatch() "{{{
	if &background == 'dark'
		hi Conceal guibg=g:seoul256_current_bg guifg=#404040
		hi Comment gui=italic
		hi String gui=italic
		hi Normal guibg=#242424
		hi StatuslineNC guifg=#060606 guibg=#707070 
		hi Statusline guifg=#060606 guibg=#A0A0A0

		hi SignColumn guibg=#333233
		hi GitGutterAdd guibg=#333233
		hi GitGutterChange guibg=#333233
		hi GitGutterDelete guibg=#333233
		hi GitGutterChangeDelete guibg=#333233
		hi SignColumn guibg=#333233

		hi VertSplit guifg=#060606 guibg=#060606
		hi NERDTreeDir guifg=#90a959 

		hi Pmenu guibg=#050505 guifg=#719872
		hi PmenuSel guifg=#dddd00 guibg=#1f82cd
		hi PmenuSbar guibg=#242424	
	endif
	call s:set_lightline_colorscheme('myseoul256')
	call NERDTreeColors()
endfunc  "}}}

function! Wombat256patch() "{{{
	hi Conceal guibg=#242424 guifg=#404040
	hi CursorLine guibg=#080808
	hi CursorLineNr guibg=#080808
	hi LineNr guibg=#333233
	hi Normal guibg=#242424

	hi GitGutterAdd guibg=#333233
	hi GitGutterChange guibg=#333233
	hi GitGutterDelete guibg=#333233
	hi GitGutterChangeDelete guibg=#333233
	hi SignColumn guibg=#333233
	hi ColorColumn guibg=#333233

	hi VertSplit guifg=#080808 guibg=#242424
	hi NonText guibg=#242424

	call NERDTreeColors()
	call s:set_lightline_colorscheme('mywombat')
	hi NERDTreeDir guifg=#0c58d3
endfunc "}}}

function! Monokaipatch () "{{{
	hi Comment gui=italic
	hi String gui=italic
	hi Conceal guifg=#404040
	let g:monokai_gui_italic = 1
	call s:set_lightline_colorscheme('molokai')
endfunc "}}}

function! Hydrangeapatch () "{{{
	hi Comment gui=italic
	hi String gui=italic
	hi Number guibg=#1e222c
endfunc "}}}

function! NERDTreeColors() "{{{
	hi Directory guifg=#404040
	hi NERDTreeCWD guifg=gray50
	hi NERDTreeFile guifg=white
	hi NERDTreeBookmarksHeader guifg=gray50
	hi NERDTreeBookmarkName guifg=gray50

endfunc "}}}

function! s:set_lightline_colorscheme(name) abort "{{{
	if !exists("g:gui_oni")
		let g:lightline.colorscheme = a:name
		call lightline#init()
		call lightline#colorscheme()
		call lightline#update()
	endif
endfunc "}}}


" NERDTree 

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg) "{{{
	" overwrites colors for [✹] etc. looks dull
	" example:
	" call NERDTreeHighlightFile('py', 'green', 'none', 'PaleTurquoise', g:seoul256_background)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction "}}}
" nnoremap <LocalLeader>n :call NERDTreeColors()<CR>

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

" Custom Background
let g:custom_background = 0
function! toggle_background() "{{{
	if g:custom_background = 1
		let g:custom_background = 0
		execute 'colorscheme' g:colors_name
	else
		let g:custom_background = 1
		hi Normal guibg=#1E2026
	endif
endfunc  "}}}
