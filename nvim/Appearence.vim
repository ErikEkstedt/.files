" APPEARENCE
set laststatus=2 "always show status bar
set termguicolors " Enable true color support.
" set t_co=256 "colormode
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" colorscheme base16-monokai
let g:seoul256_background = 234
colorscheme seoul256
augroup ColorSchemeGroup "{{{
	autocmd!
	autocmd VimEnter,ColorScheme * call ColorPatches()
	" autocmd ColorScheme * call s:lightline_update()
augroup END "}}}

function! ColorPatches() "{{{
	if g:colors_name =~ 'seoul256'
		call Seoulpatch()
	elseif g:colors_name =~ 'wombat256mod'
		call Wombat256patch()
	elseif g:colors_name =~ 'material-monokai'
		call Material_monokai_patch()
	endif
endfunc  "}}}

function! Seoulpatch() "{{{
	if &background == 'dark'
		hi Conceal guibg=g:seoul256_current_bg guifg=#404040
		hi Comment gui=italic
		hi String gui=italic

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
	endif
	call s:set_lightline_colorscheme('myseoul256')
	call NERDTreeColors()
endfunc "}}}

function! Wombat256patch() "{{{
	hi Conceal guibg=#242424 guifg=#404040
	hi CursorLine guibg=#080808
	hi CursorLineNr guibg=#080808
	hi LineNr guibg=#333233

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

function! Material_monokai_patch() "{{{
	hi Conceal guibg=#242424 guifg=#404040
	hi CursorLine guibg=#080808
	hi CursorLineNr guibg=#080808
	hi LineNr guibg=#333233
endfunc "}}}

function! NERDTreeColors() "{{{
	hi Directory guifg=#404040
	hi NERDTreeCWD guifg=gray50
	hi NERDTreeFile guifg=white
	hi NERDTreeBookmarksHeader guifg=gray50
	hi NERDTreeBookmarkName guifg=gray50
endfunc "}}}

function! s:set_lightline_colorscheme(name) abort "{{{
  let g:lightline.colorscheme = a:name
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction "}}}

"========= NERDTree ==============
" overwrites colors for [✹] etc. looks dull
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg) "{{{
	" example:
	" call NERDTreeHighlightFile('py', 'green', 'none', 'PaleTurquoise', g:seoul256_background)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction "}}}

" nnoremap <LocalLeader>n :call NERDTreeColors()<CR>

if has('windows')
	set fillchars=vert:\┃  " ┃ line with no breaks between vertical splits
endif

" change text font color to white
inoremap <leader>å <esc>:hi normal ctermfg=255 guifg=white<cr>
nnoremap <leader>å :hi normal ctermfg=255 guifg=white<cr>

" Toggle conceallevel
map <LocalLeader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
