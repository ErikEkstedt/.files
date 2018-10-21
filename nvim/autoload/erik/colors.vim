scriptencoding utf-8

augroup ColorSchemeGroup 
  autocmd!
  autocmd VimEnter,ColorScheme * call erik#colors#fix()
augroup END 

function! erik#colors#fix() abort
  echo "HELLLLOO"
  if g:colors_name =~ 'monokai'
    echo "HELLOOOOOOO"
    hi Comment gui=italic
    hi String gui=italic
    hi Conceal guifg=#404040
    hi Conceal guibg=#272822
    let g:monokai_gui_italic = 1
  endif
endfunction

function! Monokaipatch () "{{{
  " call s:set_lightline_colorscheme('molokai')
endfunc "}}}
