" ALE

let g:ale_enabled = 1

" Use quickfix list. Open list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" Appearance
" characters might messup appearance
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '?'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
let g:ale_lint_on_save = 1

" highlight ALEWarningSign guibg=303030 guifg=
" highlight ALEErrorSign guibg=303030 guifg=

" pylint
let g:ale_linters = { 'python': ['pyls', 'pylint', 'yapf', 'isort', 'mccabe'],}

" Mappings
nmap ge <Plug>(ale_next_wrap)
nmap gr <Plug>(ale_previous_wrap)
nmap <leader>at <Plug>(ale_toggle)
