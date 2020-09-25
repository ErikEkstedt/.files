if !exists("g:loaded_slime")
  finish
endif

" https://github.com/jpalardy/vim-slime
let g:slime_default_config={'socket_name': 'default', 'target_pane': '{right-of}'}
let g:slime_paste_file=tempname()
let g:slime_target='tmux'
let g:slime_python_ipython=1

xmap <cr> <Plug>SlimeRegionSend
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeLineSend
nmap <c-c><c-x> <Plug>SlimeConfig
