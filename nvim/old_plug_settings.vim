"============== Syntastic ===================={{{
" Plug 'scrooloose/syntastic'             " Syntax checking plug for Vim
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let b:syntastic_mode          = "passive"
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq   = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['python']} 

let g:syntastic_auto_jump                 = 2
let g:syntastic_always_populate_loc_list  = 1
let g:syntastic_auto_loc_list             = 1
let g:syntastic_loc_list_height           = 7
let g:syntastic_enable_signs              = 1

let g:syntastic_aggregate_errors          = 1
let g:syntastic_error_symbol              = '✘'
let g:syntastic_style_error_symbol        = '✘'
let g:syntastic_warning_symbol            = '❔'
let g:syntastic_style_warning_symbol      = 'x'
" let g:syntastic_python_python_exec        = 'python'
" let g:syntastic_python_checkers         = ['flake8', 'pydocstyle', 'pep8', 'python']
" let g:syntastic_python_flake8_post_args = '--ignore=E501,E128,E225'
let g:syntastic_python_checkers           = ['pydocstyle', 'pep8', 'python']
let g:syntastic_python_checker_args       = '--ignore=E501'

" bindings-------------------------------
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>lo :errors<cr>

" GO TO next comment 
nnoremap ge :lnext<cr>
nnoremap gE :lprevious<cr>

" }}}
