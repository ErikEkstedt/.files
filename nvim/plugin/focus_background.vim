" Background colors for active vs inactive windows
if !exists('g:custom_focus')
  finish
endif
let g:custom_focus = 1

" hi link Normal ActiveWindow
" hi InactiveWindow guibg=#242930

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
  autocmd WinLeave * call Handle_Win_Leave()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  " setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  setlocal cursorline
endfunction

function! Handle_Win_Leave()
  setlocal nocursorline
endfunction
