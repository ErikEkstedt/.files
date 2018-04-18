if exists("g:gui_oni")
	nnoremap <silent> gd :<C-u>call OniCommand("language.gotoDefinition")<CR>

	nnoremap <silent><A-h> :<C-u>call OniNextWindow('h')<CR>
	nnoremap <silent><A-j> :<C-u>call OniNextWindow('j')<CR>
	nnoremap <silent><A-k> :<C-u>call OniNextWindow('k')<CR>
	nnoremap <silent><A-l> :<C-u>call OniNextWindow('l')<CR>

endif
