" Same mappings but usage is different.

" As of now they do not interfere
" For choosing items in wildmenu
cnoremap <c-k> <Left>
cnoremap <c-j> <Right>

" For moving during writing
cnoremap <c-h> <Left>
cnoremap <c-l> <Right>

cnoremap <C-H>h <Home>
cnoremap <C-L>l <End>

" I've had custom equivalents of the new <C-g> and <C-t> mapped to
" <Tab> and <S-Tab>. Then rewritten. / Patient vimmer
" cnoremap <expr> <Tab>   getcmdtype() =~ '[\/?]' ? "<C-g>" : "<C-z>"
" cnoremap <expr> <S-Tab> getcmdtype() =~ '[\/?]' ? "<C-t>" : "<S-Tab>"

" Insert the current line in the command-line:
cnoremap <C-r><C-l> <C-r>=getline('.')<CR>

" Remove any argument from the command-line, leaving only the command and a trailing space:

cnoremap <C-k> <C-\>esplit(getcmdline(), " ")[0]<CR><Space>
