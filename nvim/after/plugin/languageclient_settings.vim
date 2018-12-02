" Language Server

" Installation

" Bash
" ----
" npm i -g bash-language-server

" JAVASCRIPT
" ----------
" npm i -g javascript-typescript-langserver

" PYTHON. PYLS
" ------------
" Source nvim-special-python env:
" (g:python3_host_prog='$HOME/miniconda3/envs/neovim3/bin/python')

" pip install python-language-server


" SETTINGS
" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'python': ['~/miniconda3/envs/neovim3/bin/pyls'],
		\ 'bash': ['~/.node_modules_global/bin/bash-language-server'],
		\ 'javascript': ['~/.node_modules_global/bin/javascript-typescript-stdio'],
		\ 'javascript.jsx': ['~/.node_modules_global/bin/javascript-typescript-stdio'],
		\ 'markdown': ['~/node_modules/markdown-language-server']
    \ }

" g:LanguageClient_diagnosticsDisplay = {
"       \ 1: {
"         \ "name": "Error",
"         \ "texthl": "ALEError",
"         \ "signText": "✖",
"         \ "signTexthl": "ALEErrorSign",
"       \ },
"       \ 2: {
"         \ "name": "Warning",
"         \ "texthl": "ALEWarning",
"         \ "signText": "⚠",
"         \ "signTexthl": "ALEWarningSign",
"       \ },
"       \ 3: {
"         \ "name": "Information",
"         \ "texthl": "ALEInfo",
"         \ "signText": "ℹ",
"         \ "signTexthl": "ALEInfoSign",
"       \ },
"       \ 4: {
"         \ "name": "Hint",
"         \ "texthl": "ALEInfo",
"         \ "signText": "➤",
"         \ "signTexthl": "ALEInfoSign",
"       \ }
" }





" Messes with ultisnips. Disable for now and rely on snippets.
" More suitable for my usecase
" \ 'sh': ['bash-language-server', 'start'],

" Mappings

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>

