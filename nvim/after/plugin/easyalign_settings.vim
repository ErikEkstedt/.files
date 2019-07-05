" vim-easy-align

" Mappings


" Markdown
autocmd FileType markdown vmap t <Plug>(EasyAlign)*\|
autocmd FileType markdown nmap <leader>ta vip<Plug>(EasyAlign)*\|

autocmd FileType latex vmap t <Plug>(EasyAlign)*\&

" Start interactive EasyAlign in visual mode (e.g. vipea=, vapea", ...)
vnoremap ea <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. ,eaip) 
nmap <leader>ea <Plug>(EasyAlign)

" Use easy align plugin to align table
autocmd FileType tex nnoremap <leader>ta vip:EasyAlign<CR>*&
