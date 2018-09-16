if colors_name =~ 'onedark'
  hi ColorColumn guibg=#1e222a

  let color_bg='guibg=#202020'

  execute 'highlight Linenr ' . color_bg

  if g:gitgutter_enabled
		execute 'hi GitGutterAdd ' . color_bg
		execute 'hi GitGutterChange ' . color_bg
		execute 'hi GitGutterDelete ' . color_bg
		execute 'hi GitGutterChangeDelete ' . color_bg
		execute 'hi SignColumn ' . color_bg
  endif
endif

hi link EndOfBuffer ColorColumn
