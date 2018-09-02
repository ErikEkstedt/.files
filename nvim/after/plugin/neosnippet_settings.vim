" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <leader><leader> <Plug>(neosnippet_expand_or_jump)
"smap <leader><leader> <Plug>(neosnippet_expand_or_jump)
"xmap <leader><leader> <Plug>(neosnippet_expand_target)

"imap <expr><C-l>
"\ neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"

"imap <expr><C-h>
"\ neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-p>"

"le g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.files/nvim/mysnippets'
"let g:neosnippet#enable_conceal_markers = 0

"" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif
