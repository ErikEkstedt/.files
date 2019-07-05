" vim: fdm=marker
" increment/decrement/ vis. selected numbers
vnoremap <leader>aa <C-a>
vnoremap <leader>AA <C-x>
vnoremap <leader>in g<C-a>

" vnoremap <c-p> "+p
vnoremap ,pa "+p
vnoremap <c-y> "+y
vnoremap <s-tab>   <gv
vnoremap <tab> >gv|

" natural end/beginning of line movement
vnoremap L $
vnoremap H ^

" Source lines
vnoremap <leader>sl y:@"<CR>

" Go to correlating pare
vnoremap gp %
