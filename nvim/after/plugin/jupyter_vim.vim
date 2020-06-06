if !exists('g:loaded_jupyter_vim')
  finish
endif

nnoremap <space><CR> vip:JupyterSendRange<CR>
nnoremap <space><C-c> :JupyterSendRange<CR>
