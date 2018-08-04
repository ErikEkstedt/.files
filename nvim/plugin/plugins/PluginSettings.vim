" vim: fdm=marker
" PLUGIN SETTINGS

" Misc pluggins with not many lines of configuration 

" Gundo
let g:gundo_prefer_python3 = 1
nnoremap gu :GundoToggle<CR>

" highlight-yank
let g:highlightedyank_highlight_duration = 1000

" vim-after-object
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '+', '*', '{')
" ca=				change after '='

" vim-peekaboo (normalmode: press " and get list of named (clipboard))
let g:peekaboo_window="vert bo 50new"


" Matlab {{{
let g:matlab_auto_mappings = 0 "automatic mappings disabled
let g:matlab_server_launcher = 'tmux' "launch the server in a tmux split
let g:matlab_server_split = 'horizontal' "launch the server in a horizontal split
"}}}

" vim-javascript {{{
augroup javascript
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

"}}}

" vim-polyglot {{{
let g:polyglot_disabled = ['latex', 'markdown', 'javascript', 'js']
let g:jsx_ext_required = 1
"}}}

" IPYTHON {{{
let g:ipy_perform_mappings=0
let g:ipy_monitor_subchannel=0

map <space><CR> <Plug>(IPython-RunLines)
map <space>p <Plug>(IPython-RunLine)
map <space>P <Plug>(IPython-RunCell)
" }}}

" Vimpyter {{{
autocmd Filetype ipynb nnoremap <silent><Leader>bb :VimpyterInsertPythonBlock<CR>
" autocmd Filetype ipynb nnoremap <silent><localleader>ll :VimpyterStartNteract<CR>
autocmd Filetype ipynb nnoremap <silent><localleader>ll :VimpyterStartJupyter<CR>
"}}}


" Vim-markdown-preview {{{
" let vim_markdown_preview_github=1  " use grip
" let vim_markdown_preview_hotkey='<localleader>lv'
" let g:vim_markdown_preview_browser='firefox'

" " 1: To display images with the hotkey mapping (defaults to Control p).
" " 2: To display images automatically on buffer write.
" " 3: To disregard images and still automatically preview on buffer write.
" let vim_markdown_preview_toggle=2
"}}}
