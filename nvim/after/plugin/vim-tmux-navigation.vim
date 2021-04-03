" Tmux-navigation

if !exists('g:loaded_tmux_navigator')
  finish
endif

let g:tmux_navigator_no_mappings = 1
nnoremap <silent><M-h> :TmuxNavigateLeft<cr>
nnoremap <silent><M-j> :TmuxNavigateDown<cr>
nnoremap <silent><M-k> :TmuxNavigateUp<cr>
nnoremap <silent><M-l> :TmuxNavigateRight<cr>
