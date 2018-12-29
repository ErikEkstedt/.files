" Settings
setlocal tw=90
setlocal linebreak

" Mappings

" Preview
nnoremap <buffer> <localleader>ll :LivedownToggle<CR>
nnoremap <buffer> <localleader>lv :LivedownPreview<CR>
nnoremap <buffer> <localleader>lk :LivedownKill<CR>

" use pandoc to turn markdown to pdf
nnoremap <buffer> <F9> :<c-u>silent call system('pandoc '.expand('%:p:S').' -o '.expand('%:p:r:S').'.pdf')<cr>
" use pandoc to turn markdown to presentation(beamer) pdf
nnoremap <buffer> <F10> :<c-u>silent call system('pandoc -s -t beamer '.expand('%:p:S').' -o '.expand('%:p:r:S').'.pdf')<cr>
" open zathura and display the .pdf with the same name as current file
nnoremap <buffer> <F12> :<c-u>silent call jobstart('zathura '.expand('%:p:r:S').'.pdf')<cr>

" augroup 
" 	au!
" 	au BufWrite *.md :!
" augroup END

nnoremap <buffer> å :! notedown <C-r>% > <C-r>%<bs><bs>ipynb


" Marker
nnoremap <buffer> <c-space> <esc>/<++><CR>"_ciw

" Text manipulation
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

" make link of entire row
nnoremap <leader>tL I[<esc>A]()<esc>h

" Get both markdown and html snippets
:UltiSnipsAddFiletypes markdown.html
