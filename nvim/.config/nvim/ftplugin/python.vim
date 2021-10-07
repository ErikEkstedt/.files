if exists("g:loaded_slime")
  " nnoremap <buffer> <silent> <cr> vap:<c-u>call slime#send_op(visualmode(), 1)<cr>
  " xnoremap <buffer> <silent> <cr> vap:<c-u>call slime#send_op(visualmode(), 1)<cr>
  nmap <buffer> <silent> <cr> <Plug>SlimeParagraphSend
  xmap <buffer> <silent> <cr> <Plug>SlimeRegionSend
endif

nnoremap <space>al gg0v/if __name__<cr>k
nnoremap gm /if __name__<cr>j

