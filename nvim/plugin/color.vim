augroup ColorSchemeGroup 
  autocmd!
  autocmd ColorScheme * call s:ColorFix()
augroup END 

function! s:ColorFix() abort
  " call s:GitGutterPatch()
  if g:colors_name =~ 'wombat'
    call s:Wombat()
  elseif g:colors_name =~ 'monokai'
    call s:Monokai()
  elseif g:colors_name =~ 'gruvbox'
    call s:Gruvbox()
  endif
endfunction

function! s:GitGutterPatch()
  hi! GitGutterAdd guibg=None
  hi! GitGutterDelete guibg=None
  hi! GitGutterChange guibg=NONE
endfunc

function! s:Gruvbox ()
  " echo "Gruvbox"
  hi! Folded guibg=NONE
  hi! SignColumn guibg=NONE
  hi! NormalNC guifg=#ab9f81 guibg=#262626

  hi! GitGutterAdd guifg=#b8bb26 guibg=NONE
  hi! GitGutterChange guifg=#fabd2f guibg=NONE
  hi! GitGutterDelete guifg=#fb4934 guibg=NONE
  hi! GitGutterChangeDelete guifg=#fa842f guibg=NONE

  hi! CocErrorSign guifg=#fb4934 guibg=None
  hi! CocWarningSign guifg=#fabd2f guibg=None
endfunc

function! s:Wombat()
  " echo "WOMBATFIX"
  hi! Folded guibg=NONE
  hi! SignColumn guibg=NONE
  hi! LineNr guibg=NONE
  hi! NormalNC guifg=#b5b3ac guibg=#222222
  hi! GitGutterAdd guifg=#95e454
  hi! GitGutterChange guifg=#b6b60c
  hi! GitGutterDelete guifg=#ff5f55
endfunc

function! s:Monokai()
  hi! Folded guibg=NONE
  hi! SignColumn guibg=NONE
  hi! LineNr guibg=NONE
  hi! NormalNC guifg=#b5b3ac guibg=#252620
  hi! CursorLine guibg=#31332b
  " hi DiffAdd guibg=None
  " hi DiffDelete guibg=None
  " hi DiffChange guibg=NONE
  hi! GitGutterAdd guifg=#95e454
  hi! GitGutterChange guifg=#b6b60c
  hi! GitGutterDelete guifg=#ff5f55
endfunc


call s:ColorFix()
