" Lightline
" let g:lightline = {'colorscheme': 'myonedark'}  " mymolokaicolor, myseoul, mywombat256 

" symbols: , , , 
let g:lightline = {
			\'separator': { 'left': '', 'right': '' },
			\'subseparator': { 'left': '|', 'right': '|' }}

let g:lightline = {
			\'component_function': {
			\'lineinfo': "MyLineinfo",
			\'nlines': "NLines",
			\'readonly': 'LightlineReadonly',
			\'fugitive': 'LightlineFugitive',
			\}}

let g:lightline.inactive = {
			\	'left': [['absolutepath']],
			\ 	'middle': [['']],
			\ 	'right': [ ['filetype'], ['nlines']] }

let g:lightline.active = { 
			\ 'left': [['mode', 'paste'], ['filename', 'readonly', 'modified'] ],
			\ 'right': [['fugitive', 'lineinfo', 'filetype']]}

let g:lightline.tab = { 
			\ 'active': ['filename', 'modified'],
			\ 'inactive': ['filename', 'modified' ]}

" Functions
function! MyLineinfo() abort
  return '[' . line('.') . '/' . line('$') . ']'
endfunction

function! NLines() abort
	return '[' . line('$') . ']'
endfunction


function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction

" Mappings
nnoremap <leader>ll :call lightline#toggle()<CR>
