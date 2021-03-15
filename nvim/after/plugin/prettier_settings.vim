" Prettier
if !exists('g:loaded_prettier')
  finish
endif

nnoremap ,pr :Prettier<CR>

" Install globally
" npm install -g prettier

" single quotes over double quotes
" let g:prettier#config#single_quote = 'true'

" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync
