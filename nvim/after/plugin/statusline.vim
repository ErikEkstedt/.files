" Statusline

" :h mode() to see all modes
let g:currentmode={
      \ 'n'      : 'NORMAL ',
      \ 'no'     : 'N·Operator Pending ',
      \ 'v'      : 'VISUAL ',
      \ 'V'      : 'V·Line ',
      \ ''     : 'V·Block ',
      \ 's'      : 'Select ',
      \ 'S'      : 'S·Line ',
      \ '\<C-S>' : 'S·Block ',
      \ 'i'      : 'INSERT ',
      \ 'R'      : 'REPLACE ',
      \ 'Rv'     : 'V·Replace ',
      \ 'c'      : 'Command ',
      \ 'cv'     : 'Vim Ex ',
      \ 'ce'     : 'Ex ',
      \ 'r'      : 'Prompt ',
      \ 'rm'     : 'More ',
      \ 'r?'     : 'Confirm ',
      \ '!'      : 'Shell ',
      \ 't'      : 'Terminal '
      \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    " exe 'hi! StatusLine guibg=g:background_color guifg=#00deff'
    exe 'hi! StatusLine guibg=' . g:status_background_color . ' guifg=#00deff'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine guifg=#ff8700'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine guifg=#3bc367'
  elseif (mode() ==# 'c')
    exe 'hi! StatusLine guifg=#e6ff00'
    exe 'syntax sync fromstart'
  elseif (mode() ==# 'R')
    exe 'hi! StatusLine guifg=#e51400'
  else
    exe 'hi! StatusLine guibg=g:background_color guifg=#00deff'
  endif
  return ''
endfunction


set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=\|
set statusline+=%<
set statusline+=\ %F
set statusline+=%=
set statusline+=%l\/%L
set statusline+=\ 
set statusline+=%r%m
set statusline+=\ 
