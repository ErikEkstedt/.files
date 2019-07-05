" Indentline

if !exists('g:IndentLine_loaded')
  finish
endif


let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_char = '│' " '┊'
let g:indentLine_first_char = '┊'  " '│' This is the first indent and the above

" let g:indentLine_setConceal = 0
" let g:indentLine_showFirstIndentLevel=1

" Mapping
nnoremap <leader>in :IndentLinesToggle<CR>
