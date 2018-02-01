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
"         \| let g:lightline = {'colorscheme': 'mymolokaicolor'} 
" augroup END

let g:seoul256_background = 234
colorscheme seoul256
augroup seoul256_patch
  autocmd!
  autocmd VimEnter,ColorScheme * if g:colors_name =~ 'seoul256'
        \|   if &background == 'dark'
        \|     hi Conceal guibg=g:seoul256_current_bg
        \|     hi Conceal guifg=g:seoul256_current_fg-20
        \|     hi StatuslineNC guifg=#060606 guibg=#707070 
        \|     hi Statusline guifg=#060606 guibg=#A0A0A0
        \| endif
augroup END

" NERDTress File highlighting
" overwrites colors for [✹] etc. looks dull
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
" example:
" call NERDTreeHighlightFile('py', 'green', 'none', 'PaleTurquoise', g:seoul256_background)

if has('windows')
	set fillchars=vert:\┃  " ┃ line with no breaks between vertical splits
endif

" change text font color to white
inoremap <leader>å <esc>:hi normal ctermfg=255 guifg=white<cr>
nnoremap <leader>å :hi normal ctermfg=255 guifg=white<cr>

" Toggle conceallevel
map <LocalLeader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
