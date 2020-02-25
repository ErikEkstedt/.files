"" Vimtex
"let g:vimtex_enabled = 1

"" TODO: mac pdf-viewer ?

if g:UNAME == 'Darwin'
  let g:latex_view_general_viewer = 'skim'
  let g:vimtex_view_method = 'skim'
else
  let g:latex_view_general_viewer = 'zathura'
  let g:vimtex_view_method = 'zathura'
endif

" let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_progname = $HOME.'/miniconda3/envs/neovim3/bin/nvr'
"let g:vimtex_complete_recursive_bib = 2
"let g:vimtex_complete_enabled = 1
"let g:vimtex_complete_close_braces = 1
"let g:vimtex_fold_enabled = 1
"" fix slowness - disable these
""normal :NoMatchParen
"let g:vimtex_motion_matchparen = 1

"" Mappings
"nmap <space>tt <plug>(vimtex-compile-toggle)	
"nmap <space>c <plug>(vimtex-view)



"" Functions

augroup vimtex_event_1
	au!
	au User VimtexEventQuit     call vimtex#compiler#clean(0)
augroup END

augroup vimtex_event_2
	au!
	au User VimtexEventQuit call CloseViewers()
augroup END

" Close viewers on quit
function! CloseViewers()
	if executable('xdotool') && exists('b:vimtex')
			\ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
		call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
	endif
endfunction


