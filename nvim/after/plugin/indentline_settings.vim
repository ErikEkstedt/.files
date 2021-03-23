" Indentline

if !exists('g:indentLine_loaded')
  finish
endif

" Not working
" function! ReturnHighlightTerm(group, term)
"   " Store output of group to variable
"   let output = execute('hi ' . a:group)
"   " Find the term we're looking for
"   return matchstr(output, a:term.'=\zs\S*')
" endfunction
" let g:indentLine_color_gui = ReturnHighlightTerm('Comment', 'guifg')
" let g:indentLine_bgcolor_gui = ReturnHighlightTerm('Comment', 'guibg')
"

" Mapping
nnoremap <leader>in :IndentLinesToggle<CR>
nnoremap <space>in :IndentLinesToggle<CR>

" Exclusion
let g:indentLine_enabled = 0
let g:indentLine_bufNameExclude = ['NERD_tree.*']
let g:indentLine_fileTypeExclude = ['help', 'nerdtree']
let g:indentLine_bufTypeExclude = ['help', 'nerdtree', 'terminal', 'quickfix']

" set to 1 if using g:indentLine_color_gui
let g:indentLine_setColors = 1
let g:indentLine_color_gui = '#5C6370'
" let g:indentLine_bgcolor_gui = '' 

let g:indentLine_char = '┊' " '┊'
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'  " '│' This is the first indent and the above


" let g:indentLine_showFirstIndentLevel=1
let g:indentLine_showFirstIndentLevel=0


" let g:indentLine_setConceal = 0
" let g:indentLine_showFirstIndentLevel=1

