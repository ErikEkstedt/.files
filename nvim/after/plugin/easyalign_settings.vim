" vim-easy-align

" Mappings


" Markdown
autocmd FileType markdown vmap t <Plug>(EasyAlign)*\|
autocmd FileType markdown nmap <leader>ta vip<Plug>(EasyAlign)*\|
autocmd FileType latex    vmap t <Plug>(EasyAlign)*\&

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ea <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use easy align plugin to align table
autocmd FileType tex nmap <leader>ta vip:EasyAlign<CR>*&
