" APPEARENCE
set laststatus=2 "always show status bar
set t_co=256 "colormode

set termguicolors " Enable true color support.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" colors
" colorscheme base16-monokai
let g:seoul256_background = 234
colo seoul256

" colorscheme onedark
" hi CursorLine guibg=#383838

" Toggle conceallevel
map <LocalLeader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" ======= HIGHLIGHTS =================
hi CursorLineNr ctermfg=87 guifg=white

if has('windows')
	set fillchars=vert:\┃  " ┃ line with no breaks between vertical splits
	hi VertSplit ctermfg=51
	hi VertSplit guibg=bg guifg=#b5bd68
endif

" change text font color to white
inoremap <leader>å <esc>:hi normal ctermfg=255 guifg=white<cr>
nnoremap <leader>å :hi normal ctermfg=255 guifg=white<cr>
