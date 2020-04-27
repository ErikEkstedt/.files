if !exists('g:loaded_floatLf')
  finish
endif

" nnoremap <space>lf :LfToggle<CR>
nnoremap <space>f :LfToggle<CR>

" let g:floatLf_autoclose = 1
let g:floatLf_lf_close = '<esc>'
let g:floatLf_lf_open = '<CR>'
let g:floatLf_lf_split = '<c-l>'
let g:floatLf_lf_vsplit = '<c-j>'
