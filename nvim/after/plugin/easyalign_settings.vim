" vim-easy-align
if !exists(':EasyAlign')
	finish	
endif

" Markdown
autocmd FileType markdown vmap t <Plug>(EasyAlign)*\|
autocmd FileType markdown nmap <leader>ta vip<Plug>(EasyAlign)*\|
autocmd FileType latex    vmap t <Plug>(EasyAlign)*\&
" Use easy align plugin to align table
autocmd FileType tex nmap <leader>ta vip:EasyAlign<CR>*&

" Mappings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ea <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
