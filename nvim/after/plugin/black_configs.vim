" Black Formatter

" Format on save
autocmd BufWritePre *.py execute ':Black'

nnoremap <space>li :Black<CR>
