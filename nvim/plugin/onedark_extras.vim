augroup ColorSchemeGroup
  autocmd!
  autocmd VimEnter,ColorScheme * call OnedarkColor()
augroup END


function! OnedarkColor()
  if !g:colors_name =~ 'onedark'
    finish
  endif

  hi Conceal guifg=#404040
endfunc
