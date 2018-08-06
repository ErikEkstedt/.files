" Language Server
"
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['~/javascript-typescript-langserver/lib/language-server-stdio'],
    \ 'python': ['~/miniconda3/envs/neovim3/bin/pyls']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>

" JAVASCRIPT
" Clone the javascript-typescript Lang-Server repo
" git clone https://github.com/sourcegraph/javascript-typescript-langserver
" cd javascript-typescript-langserver
" npm install  # install dependencies
" npm run build  # compile
" npm run test  # runt test

" PYTHON. PYLS
"
" Source nvim-special-python env:
" (g:python3_host_prog='/Users/erik/miniconda3/envs/neovim3/bin/python') 
"
" pip install python-language-server
