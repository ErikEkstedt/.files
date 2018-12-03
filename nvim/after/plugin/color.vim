" TODO
" Fix toggle transparancy: hi link EndOfBuffer ColorColumn, gitgutter

if colors_name =~ 'onedark'
  hi ColorColumn guibg=#1e222a
  let color_bg='guibg=#202020'
  execute 'highlight Linenr ' . color_bg

  if g:gitgutter_enabled
		execute 'hi GitGutterAdd guifg=#98c379 ' . color_bg
		execute 'hi GitGutterChange guifg=#e5c07b ' . color_bg
		execute 'hi GitGutterDelete guifg=#983333 ' . color_bg
		execute 'hi GitGutterChangeDelete guifg=#983333 ' . color_bg
		execute 'hi SignColumn ' . color_bg
  endif


endif

hi link EndOfBuffer ColorColumn
