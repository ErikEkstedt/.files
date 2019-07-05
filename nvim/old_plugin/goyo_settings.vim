" GoYo

" mappings
nnoremap <silent> <leader>gg :Goyo<CR>


" Setttings
let g:goyo_width  = 100  " (default: 80)
let g:goyo_linenr = 0   " (default: 0)


" Functions 

function! s:goyo_enter()
  " Goyo and tmux
  silent !tmux set status off
  " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
	set cursorline
endfunction


function! s:goyo_leave()
  silent !tmux set status on
  " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showcmd
endfunction


autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
