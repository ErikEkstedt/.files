setlocal shiftwidth=2
setlocal fdm=indent

augroup html
	autocmd!
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> p  <p>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> h1 <h1>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> h2 <h2>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> h4 <h3>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> h6 <h4>
	autocmd BufNewFile,BufRead *.html iabbrev <buffer> div <div>
augroup END


nnoremap j gj
nnoremap k gk

nnoremap <leader>li  0wi<li><esc>A</li><esc>0

" Marker
nnoremap <buffer> <c-space> <esc>/<++><CR>"_ciw

" 101=e, 102=f, 105=i, 109=m 
let b:surround_102 = "<strong>\r</strong>"
let b:surround_105 = "<em>\r</em>"
nnoremap <leader>tb :normal ysiWf<CR> 
nnoremap <leader>ti :normal ysiWi<CR>
