inoremap <c-s> <esc>:w<cr>
inoremap <c-q> <esc>:q!<cr>
" inoremap <c-p> <esc>"+pi

inoremap <c-l> <Right>
inoremap <c-h> <Left>
" inoremap <c-j> <Down>
" inoremap <c-k> <Up>

imap <expr> <s-Tab> pumvisible() ? "\<C-P>" : "\<esc><<i"
