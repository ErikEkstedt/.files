inoremap <c-s> <esc>:w<cr>
inoremap <c-q> <esc>:q!<cr>
" inoremap <c-p> <esc>"+pi

" inoremap <c-l> <Right>
" inoremap <c-h> <Left>
" inoremap <c-j> <Down>
" inoremap <c-k> <Up>

inoremap <c-a> <esc>^i
inoremap <c-e> <esc>A

inoremap <M-n> <BS>
inoremap <M-m> <CR>

" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <s-Tab> pumvisible() ? "\<C-P>" : "\<esc><<<left>i"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" input [] from macos+synergy 
inoremap ,bb []<Left>
