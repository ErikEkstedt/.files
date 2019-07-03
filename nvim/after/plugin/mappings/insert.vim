inoremap <c-s> <esc>:w<cr>
inoremap <c-q> <esc>:q!<cr>
" inoremap <c-p> <esc>"+pi

inoremap <c-l> <Right>
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>


" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<esc><<i"
