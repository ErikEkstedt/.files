" Prettier
if !eval('g:loaded_prettier')
  finish
endif

nnoremap ,pr :Prettier<CR>


autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
