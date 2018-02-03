" APPEARENCE
set laststatus=2 "always show status bar
set termguicolors " Enable true color support.
" set t_co=256 "colormode
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" =========== COLORSCHEME =========={{{
" colorscheme base16-monokai

let g:seoul256_background = 234
colorscheme seoul256
augroup ColorSchemeGroup
	autocmd!
	autocmd VimEnter,ColorScheme * call ColorPatches()
	autocmd ColorScheme * call s:lightline_update()
augroup END

function! ColorPatches()
	if g:colors_name =~ 'seoul256'
		call Seoulpatch()
	elseif g:colors_name =~ 'wombat256mod'
		call Wombat256patch()
	endif
endfunc

function! Seoulpatch()
	if &background == 'dark'
		hi Conceal guibg=g:seoul256_current_bg guifg=#404040
		hi StatuslineNC guifg=#060606 guibg=#707070 
		hi Statusline guifg=#060606 guibg=#A0A0A0
		hi SignColumn guibg=#333233
		hi GitGutterAdd guibg=#333233
		hi GitGutterChange guibg=#333233
		hi GitGutterDelete guibg=#333233
		hi GitGutterChangeDelete guibg=#333233
		hi SignColumn guibg=#333233
		hi VertSplit guifg=#060606 guibg=#060606
	endif
	call NERDTreeColors()
endfunc

function! Wombat256patch()
	hi Conceal guibg=#242424 guifg=#00AA00
	hi CursorLine guibg=#080808
	hi CursorLineNr guibg=#080808
	hi LineNr guibg=#333233
	hi GitGutterAdd guibg=#333233
	hi GitGutterChange guibg=#333233
	hi GitGutterDelete guibg=#333233
	hi GitGutterChangeDelete guibg=#333233
	hi SignColumn guibg=#333233
	hi VertSplit guifg=#080808 guibg=#242424
	hi NonText guibg=#242424

endfunc

function! s:lightline_update()
	if !exists('g:loaded_lightline')
		return
	endif
	try
		" if g:colors_name =~# 'solarized\|landscape\|jellybeans\|tomorrow'
		" 	let g:lightline.colorscheme = substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') .
		" 				\ (g:colors_name ==# 'solarized' ? '_' . &background : '')
		if g:colors_name =~# 'wombat'
			let g:lightline.colorscheme = 'wombat'
		elseif g:colors_name =~# 'seoul256'
			let g:lightline.colorscheme = 'myseoul256'
		endif
		call lightline#init()
		call lightline#colorscheme()
		call lightline#update()
	catch
	endtry
endfunction

"========= NERDTree ==============
" overwrites colors for [✹] etc. looks dull
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	" example:
	" call NERDTreeHighlightFile('py', 'green', 'none', 'PaleTurquoise', g:seoul256_background)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

function! NERDTreeColors()
	hi NERDTreeDir guifg=#90a959 
	hi Directory guifg=#404040
	hi NERDTreeCWD guifg=gray50
	hi NERDTreeFile guifg=white
	hi NERDTreeBookmarksHeader guifg=gray50
	hi NERDTreeBookmarkName guifg=gray50
endfunc
" nnoremap <LocalLeader>n :call NERDTreeColors()<CR>


if has('windows')
	set fillchars=vert:\┃  " ┃ line with no breaks between vertical splits
endif

" change text font color to white
inoremap <leader>å <esc>:hi normal ctermfg=255 guifg=white<cr>
nnoremap <leader>å :hi normal ctermfg=255 guifg=white<cr>

" Toggle conceallevel
map <LocalLeader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
