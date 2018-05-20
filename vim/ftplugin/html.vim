setlocal shiftwidth=2
setlocal fdm=indent

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
