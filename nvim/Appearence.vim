" APPEARENCE
set laststatus=2 "always show status bar
set termguicolors " Enable true color support.
" set t_co=256 "colormode
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" =========== COLORSCHEME =========={{{
" colorscheme base16-monokai

" augroup monokai
"   autocmd!
"   autocmd VimEnter,ColorScheme * if g:colors_name =~ 'base16-monokai'
"         \|   if &background == 'dark'
"         \|     hi Conceal guibg=g:seoul256_current_bg
"         \|     hi Conceal guifg=g:seoul256_current_fg-20
"         \|     hi StatuslineNC guifg=#060606 guibg=#707070 
"         \|     hi Statusline guifg=#060606 guibg=#A0A0A0
"         \| endif
" augroup END

let g:seoul256_background = 234
colorscheme seoul256
augroup colorshemechanges
	autocmd!
	autocmd ColorScheme * if g:colors_name =~ 'seoul256' | :call Seoulpatch()
	autocmd ColorScheme * if g:colors_name =~ 'wombat256mod'| :call Wombat256patch()
augroup END

function! Seoulpatch()
	if &background == 'dark'
		hi Conceal guibg=g:seoul256_current_bg
		hi Conceal guifg=#404040
		hi StatuslineNC guifg=#060606 guibg=#707070 
		hi Statusline guifg=#060606 guibg=#A0A0A0
		" hi VertSplit guifg=#252525
		" hi VertSplit guibg=#060606
	endif
	call lightline#enable()
	call NERDTreeColors()
endfunc
function! Wombat256patch()
	hi Conceal guibg=#AA0000
	hi Conceal guifg=#00AA00
	hi VertSplit guifg=#252525
	hi VertSplit guibg=#060606
	call lightline#disable()
	let g:lightline = {'colorscheme': 'wombat'} 
	call lightline#enable()
endfunc

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
