" vim-surround

if !exists('g:loaded_surround')
  finish
endif

" mappings
nnoremap <leader>' :normal ysiW'<CR>
nnoremap <leader>" :normal ysiW"<CR>
nnoremap <leader>} :normal ysiW}<CR>
nnoremap <leader>{ :normal ysiW}<CR>

nnoremap ( :normal ysiW)<CR>
nnoremap ) :normal ysiW)<CR>
nnoremap [ :normal ysiW]<CR>
nnoremap ] :normal ysiW]<CR>
nnoremap ,ta :normal ysiW><CR>
" nnoremap <leader>B :normal ysiW}<CR>
" nnoremap <leader>r :normal ysiW]<CR>



" HTML
" 101=e, 102=f, 105=i, 109=m 
autocmd FileType html let b:surround_102 = "<strong>\r</strong>"
autocmd FileType html let b:surround_105 = "<em>\r</em>"
" bold
autocmd FileType html nnoremap <buffer><leader>tb :normal ysiWf<CR> 
" italic
autocmd FileType html nnoremap <buffer><leader>ti :normal ysiWi<CR>

" MARKDOWN
" 102=f, 105=i, 108=l,
autocmd FileType markdown let b:surround_102 = "**\r**"
autocmd FileType markdown let b:surround_105 = "*\r*"
autocmd FileType markdown let g:surround_108 = "[\r]()"

" italic
autocmd FileType markdown nnoremap <buffer><leader>tb :normal ysiWf<CR> 
" bold
autocmd FileType markdown nnoremap <buffer><leader>ti :normal ysiWi<CR>
" link
autocmd FileType markdown nnoremap <buffer><leader>tl :normal ysiWl<CR> 


" LATEX
" 101=e, 102=f, 105=i, 109=m
autocmd FileType tex let b:surround_101 = "\\emph{\r\}"
autocmd FileType tex let b:surround_102 = "\\textbf{\r\}"
autocmd FileType tex let b:surround_105 = "\\textit{\r\}"
autocmd FileType tex let b:surround_109 = "\\(\r\\)"

" emph
autocmd FileType tex nnoremap <buffer><leader>te :normal ysiWe<CR>
" bold
autocmd FileType tex nnoremap <buffer><leader>tb :normal ysiWf<CR> 
" italic
autocmd FileType tex nnoremap <buffer><leader>ti :normal ysiWi<CR>
" math
autocmd FileType tex nnoremap <buffer><leader>tm :normal ysiWm<CR>
