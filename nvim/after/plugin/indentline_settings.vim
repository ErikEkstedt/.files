" Indentline

" if !eval("g:indentLine_loaded")
"   finish
" endif


" Exclusion
let g:indentLine_enabled = 0
let g:indentLine_bufNameExclude = ['NERD_tree.*']
let g:indentLine_fileTypeExclude = ['help', 'nerdtree']
let g:indentLine_bufTypeExclude = ['help', 'nerdtree', 'terminal']

let g:indentLine_setColors = 0
let g:indentLine_char = '┊' " '┊'
let g:indentLine_first_char = '│'  " '│' This is the first indent and the above

" let g:indentLine_setConceal = 0
" let g:indentLine_showFirstIndentLevel=1

" Mapping
nnoremap <leader>in :IndentLinesToggle<CR>
