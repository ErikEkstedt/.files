" Lightline
let g:lightline = {'colorscheme': 'myonedark'}  " mymolokaicolor, myseoul, mywombat256 

" " A dictionary for statusline/tabline components.
" " The default value is:
" let g:lightline.component = {
"     \ 'mode': '%{lightline#mode()}',
"     \ 'absolutepath': '%F',
"     \ 'relativepath': '%f',
"     \ 'filename': '%t',
"     \ 'modified': '%M',
"     \ 'bufnum': '%n',
"     \ 'paste': '%{&paste?"PASTE":""}',
"     \ 'readonly': '%R',
"     \ 'charvalue': '%b',
"     \ 'charvaluehex': '%B',
"     \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
"     \ 'fileformat': '%{&ff}',
"     \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
"     \ 'percent': '%3p%%',
"     \ 'percentwin': '%P',
"     \ 'spell': '%{&spell?&spelllang:""}',
"     \ 'lineinfo': '%3l:%-2v',
"     \ 'line': '%l',
"     \ 'column': '%c',
"     \ 'close': '%999X X ',
"     \ 'winnr': '%{winnr()}' }

function! MyLineinfo() abort
  return '[' . line('.') . '/' . line('$') . ']'
endfunction

function! NLines() abort
  return '[' . line('$') . ']'
endfunction

let g:lightline = {
      \ 'component_function': {
      \   'lineinfo': "MyLineinfo",
      \   'nlines': "NLines" }}

let g:lightline.inactive = {
			\	'left': [['absolutepath']],
			\ 	'middle': [['']],
			\ 	'right': [ ['filetype'], ['nlines']] }

let g:lightline.active = { 
			\ 'left': [['mode', 'paste'], ['filename', 'readonly', 'modified', 'fugitive'] ],
			\ 'right': [['lineinfo', 'filetype' ]]}

let g:lightline.tab = { 
			\ 'active': ['filename', 'modified'],
			\ 'inactive': ['filename', 'modified' ]}
