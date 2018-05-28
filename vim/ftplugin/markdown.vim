
" Preview
nnoremap <buffer> <localleader>ll :LivedownToggle<CR>
nnoremap <buffer> <localleader>lv :LivedownPreview<CR>
nnoremap <buffer> <localleader>lk :LivedownKill<CR>

" Marker
nnoremap <buffer> <c-space> <esc>/<++><CR>"_ciw

" my quote 
nnoremap ,ee i(EE: )<esc>i

" tpope/vim-surround
" 109=m, 105=i, 101=e, 102=f
" let b:surround_109 = "\\(\r\\)"
let b:surround_105 = "*\r*"
let b:surround_102 = "**\r**"
let b:surround_101 = "[<++>](\r\)"

nnoremap <leader>tb :normal ysiWf<CR> 
nnoremap <leader>ti :normal ysiWi<CR>
nnoremap <leader>te :normal ysiWe<CR>
nnoremap <leader>tm :normal ysiWm<CR>
