" Slimux
if !exists('g:slimux_tmux_path')
  finish
endif

let g:slimux_python_use_ipython = 1
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>gv<Esc>zz
nnoremap <C-c><C-x> :SlimuxREPLConfigure<CR>
