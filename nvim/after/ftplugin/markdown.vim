" Settings
" setlocal tw=100
" setlocal linebreak
" setlocal tabstop=4                         " no. of spaces for tab in file
" setlocal shiftwidth=4                      " no. of spaces for step in autoindent
" setlocal softtabstop=4                     " no. of spaces for tab when editing

" Mappings

" use pandoc to turn markdown to pdf
" nnoremap <buffer> <F9> :<c-u>silent call system('pandoc '.expand('%:p:S').' -o '.expand('%:p:r:S').'.pdf')<cr>
" " use pandoc to turn markdown to presentation(beamer) pdf
" nnoremap <buffer> <F10> :<c-u>silent call system('pandoc -s -t beamer '.expand('%:p:S').' -o '.expand('%:p:r:S').'.pdf')<cr>
" " open zathura and display the .pdf with the same name as current file
" nnoremap <buffer> <F12> :<c-u>silent call jobstart('zathura '.expand('%:p:r:S').'.pdf')<cr>


" make link of entire row
" nnoremap <leader>tL I[<esc>A]()<esc>h

" inoremap <leader>ma $$$$<left><left>

" Get both markdown and html snippets
" set filetype=markdown.html
" :UltiSnipsAddFiletypes markdown.latex.html
