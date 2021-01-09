" Coc-Vim Settings
if !exists('g:did_coc_loaded')
  finish
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From example at https://github.com/neoclide/coc.nvim
" Highlight symbol under cursor on CursorHold

" PLUGINS
" coc-highlight ------------------------------------------
" autocmd CursorHold * silent call CocActionAsync('highlight')

" To disable coc provide color highlight, add:
"coc.preferences.colorSupport": false, to your settings.json.

" To pick a different color, use command:
"   :call CocAction('pickColor')
" Note: only works on Mac or have python gtk module installed.

"To pick a different color presentation, use command:
"   :call CocAction('colorPresentation')
" --------------------------------------------------------

" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Close preview window when completion is done
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=200

"MAPPINGS ---------------------------------------------------------
"
" Use enter to complete completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <leader><leader> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent>gw <Plug>(coc-diagnostic-next)
nmap <silent>gW <Plug>(coc-diagnostic-prev)

nmap <silent> ,nn <Plug>(coc-diagnostic-next-error)
nmap <silent> ,np <Plug>(coc-diagnostic-prev-error)

imap <leader><leader> <Plug>(coc-snippets-expand)

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Functions ------------------------------------------------------------
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight ----------------------------------------------------------

" Float
autocmd! VimEnter,ColorScheme * call SetCocHighlights()
function! SetCocHighlights()
  hi CocErrorSign guifg=#990000
  hi CocErrorFloat guifg=#ff910c
  hi CocWarningSign guifg=#ff910c
  hi CocWarningFloat guifg=#990000
  " hi CocHintSign guifg=#8ec07c
  " hi CocHintFloat guifg=#8ec07c
  hi! link CocHintSign Comment
  hi! link CocHintFloat Comment
  hi! link CocInfoSign Comment
  hi! link CocInfoFloat Comment
  " CocWarningSign xxx guifg=#fabd2f euibg=None
  " CocInfoSign    xxx links to GruvboxBlueSign
  " CocWarningFloat xxx links to GruvboxOrange
  " CocHintFloat   xxx links to GruvboxAqua
  " CocDiagnosticsError xxx links to GruvboxRed
  " CocDiagnosticsWarning xxx links to GruvboxOrange
  " CocDiagnosticsInfo xxx links to GruvboxBlue
  " CocDiagnosticsHint xxx links to GruvboxAqua
  " CocSelectedText xxx links to GruvboxRed
  " CocCodeLens    xxx links to GruvboxGray
  " CocErrorHighlight xxx links to GruvboxRedUnderline
  " CocWarningHighlight xxx links to GruvboxOrangeUnderline
  " CocInfoHighlight xxx links to GruvboxBlueUnderline
  " CocHintHighlight xxx links to GruvboxAquaUnderline
endfunc
