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
set updatetime=300

"MAPPINGS ---------------------------------------------------------
"
" Use enter to complete completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent>gw <Plug>(coc-diagnostic-next)
nmap <silent>gW <Plug>(coc-diagnostic-prev)

nmap <silent> ,nn <Plug>(coc-diagnostic-next-error)
nmap <silent> ,np <Plug>(coc-diagnostic-prev-error)

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
" autocmd! VimEnter,ColorScheme * call SetCocHighlights()
" function! SetCocHighlights()
"   hi CocFloating guifg=#98d335 guibg=#191919
"   hi CocInfoFloat guifg=#66ffff 
"   hi CocHintFloat guifg=#108080
"   hi CocErrorFloat guifg=#ff0000 guibg=none
"   hi CocWarningFloat guifg=##d49b05
" endfunc

" hi CocErrorHighlight guifg=#e9134e 
" hi CocWarningHighlight guifg=#cf9f28 
" hi CocInfoHighlight guifg=#aaaaaa
" hi CocHintHighlight 

" hi CocHighlightText guifg=#11aa33
" hi CocHighlightText  guibg=#111111 ctermbg=223
" hi CocHighlightRead guifg=#98d335 
" hi CocHighlightWrite guibg=#303744 guifg=#e93491 


