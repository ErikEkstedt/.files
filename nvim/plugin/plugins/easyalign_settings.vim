" vim-easy-align

" Mappings
autocmd FileType markdown vmap t <Plug>(EasyAlign)*\|
autocmd FileType markdown nmap <leader>ta vip<Plug>(EasyAlign)*\|
autocmd FileType latex vmap t <Plug>(EasyAlign)*\&

" Start interactive EasyAlign in visual mode (e.g. vipea=, vapea", ...)
vmap ea <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. ,eaip) 
nmap <leader>ea <Plug>(EasyAlign)
