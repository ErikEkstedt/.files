" Coc-Vim Settings
if !exists('g:did_coc_loaded')
  finish
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From example at https://github.com/neoclide/coc.nvim
" Highlight symbol under cursor on CursorHold

" PLUGINS
" coc-highlight ------------------------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <c-space> for trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Highlight

" Default: `hi CocErrorSign  ctermfg=Red guifg=#ff0000`
" The highlight used for error signs.
" highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
" hi CocErrorSign  ctermfg=Red guifg=#ff0000
" hi CocWarningSign  ctermfg=Brown guifg=#ff922b
hi CocInfoSign  guifg=#89db41
" hi CocHintSign  ctermfg=Blue guifg=#15aabf

hi CocErrorHighlight guifg=#e9134e 
hi CocWarningHighlight guifg=#cf9f28 
hi CocInfoHighlight guifg=#8f29e6
" hi CocHintHighlight 

" hi CocHighlightText guifg=#11aa33
" hi CocHighlightText  guibg=#111111 ctermbg=223
hi CocHighlightRead guifg=#98d335 
hi CocHighlightWrite guibg=#303744 guifg=#e93491 

" Float
hi CocFloating guifg=#aa00aa
hi CocErrorFloat guifg=#ff0000
hi CocWarningFloat guifg=#ddaa00 
hi CocInfoFloat guifg=#0055DD 
hi CocHintFloat guifg=#2ed1cd

