" Vimwiki 
" https://github.com/vimwiki/vimwiki

" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/JobWiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_list = [
            \{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'},
            \{'path': '~/jobwiki', 'syntax': 'markdown', 'ext':'.md'}]
" nnoremap <leader>wj <plug>vimwiki

" Mappings

let g:vimwiki_table_mappings=0

nmap <Leader>ww <plug>VimwikiIndex
nmap <Leader>wj 2<plug>VimwikiIndex
