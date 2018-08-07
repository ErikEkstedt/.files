" Language Server
" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
		\ 'javascript': ['~/.node_modules_global/bin/javascript-typescript-stdio'],
		\ 'javascript.jsx': ['~/.node_modules_global/bin/javascript-typescript-stdio'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'python': ['~/miniconda3/envs/neovim3/bin/pyls']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>


" Bash
" npm i -g bash-language-server 

" JAVASCRIPT
" npm i -g javascript-typescript-langserver

" PYTHON. PYLS
" Source nvim-special-python env:
" (g:python3_host_prog='/Users/erik/miniconda3/envs/neovim3/bin/python') 
"
" pip install python-language-server
