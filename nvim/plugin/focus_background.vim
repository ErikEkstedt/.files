" Background colors for active vs inactive windows
hi ActiveWindow guibg=#141619
hi InactiveWindow guibg=#101315

hi HiStatus guibg=#111111 guifg=#00ceff
hi HiStatusInsert guibg=#111111 guifg=#19f31e
hi HiStatusCmd guibg=#111111 guifg=#fd8808

hi HiStatusVisual guibg=#111111 guifg=##19f31e
hi HiStatusReplace guibg=#111111 guifg=##19f31e

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
  autocmd WinLeave * call Handle_Win_Leave()
  " autocmd InsertEnter * call StatusInsert()
  " autocmd InsertLeave * call StatusNormal()
  " autocmd CmdWinEnter * call StatusCmd()
  " autocmd CmdLineEnter * call StatusCmd()
  " autocmd CmdLineLeave * call StatusNormal()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  setlocal cursorline 

  " TODO: Remove Nerdtree from this setting
  if has("conceal") || exists("g:indentLine_loaded")
    exe 'IndentLinesToggle'
  endif

endfunction

function! Handle_Win_Leave()
  setlocal nocursorline 
  if has("conceal") || exists("g:indentLine_loaded")
    exe 'IndentLinesToggle'
  endif
endfunction

function! StatusNormal()
  setlocal winhighlight=StatusLine:HiStatus
endfunction

function! StatusInsert()
  setlocal winhighlight=StatusLine:HiStatusInsert
endfunction

function! StatusCmd()
  setlocal winhighlight=StatusLine:HiStatusCmd
endfunction
