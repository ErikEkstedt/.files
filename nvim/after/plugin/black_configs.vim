" Black Formatter

" Format on save
autocmd BufWritePre *.py execute ':Black'

nnoremap <leader>li :Black<CR>
