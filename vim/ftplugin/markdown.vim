
" Preview
nnoremap <buffer> <localleader>ll :LivedownToggle<CR>
nnoremap <buffer> <localleader>lv :LivedownPreview<CR>
nnoremap <buffer> <localleader>lk :LivedownKill<CR>

" Marker
nnoremap <buffer> <c-space> <esc>/<++><CR>"_ciw

" my quote 
nnoremap ,ee i(EE: )<esc>i


" Text manipulation
nnoremap <leader>tL I[<esc>A]()<esc>h

" tpope/vim-surround
" 101=e, 102=f, 105=i, 109=m,
" let b:surround_109 = "\\(\r\\)"
let b:surround_105 = "*\r*"
let b:surround_102 = "**\r**"
let b:surround_101 = "[<++>](\r\)"
let g:surround_108 = "[\r]()"

nnoremap <leader>tl :normal ysiWl<CR> 
nnoremap <leader>tb :normal ysiWf<CR> 
nnoremap <leader>ti :normal ysiWi<CR>
nnoremap <leader>te :normal ysiWe<CR>
nnoremap <leader>tm :normal ysiWm<CR>

set tw=90
