" Vimwiki 
" https://github.com/vimwiki/vimwiki


let g:vimwiki_list = [
            \{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'},
            \{'path': '~/jobwiki', 'syntax': 'markdown', 'ext':'.md'}]

" Mappings

let g:vimwiki_table_mappings=0
let g:vimwiki_conceallevel=0

" Open index
nmap <Leader>ww <plug>VimwikiIndex

" Open second entri in vimwiki_list
nmap <Leader>wj 2<plug>VimwikiIndex
