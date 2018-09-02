" Tmux-navigation
let g:tmux_navigator_no_mappings = 1

if !exists('g:gui_oni')
	nnoremap <silent><Left> :TmuxNavigateLeft<cr>
	nnoremap <silent><Down> :TmuxNavigateDown<cr>
	nnoremap <silent><Up> :TmuxNavigateUp<cr>
	nnoremap <silent><Right> :TmuxNavigateRight<cr>
endif
