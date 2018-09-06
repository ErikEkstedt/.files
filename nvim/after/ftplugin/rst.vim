let g:RstPreview_on = 0
function! TogglePreview()
	if g:RstPreview_on == 0
		execute 'InstantRst'
		let g:RstPreview_on = 1
	else
		execute 'StopInstantRst'
		:echo  "Stopped InstantRst-Preview"
		let g:RstPreview_on = 0
	endif
endfunc
map <LocalLeader>ll :call TogglePreview()<cr>
