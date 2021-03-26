if !exists('g:indent_blankline_enabled')
  finish
endif

hi IndentBlankLine1 guifg='#373737'
hi IndentBlankLine2 guifg='#474747'
hi IndentBlankLine3 guifg='#575757'
hi IndentBlankLine4 guifg='#676767'
hi IndentBlankLine5 guifg='#777777'


let g:indent_blankline_char = '│'
let g:indent_blankline_char_highlight_list = ['IndentBlankLine1', 'IndentBlankLine2', 'IndentBlankLine3', 'IndentBlankLine4', 'IndentBlankLine5']
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_enabled = v:false " Toggle not working after this?

nnoremap <leader>in :IndentBlanklineToggle<CR>
nnoremap <space>in :IndentBlanklineToggle<CR>
