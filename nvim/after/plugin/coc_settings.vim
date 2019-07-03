" Coc-Vim Settings
if !exists('g:did_coc_loaded')
  finish
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From example at https://github.com/neoclide/coc.nvim
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <c-space> for trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

hi CocHighlightText guifg=#11aa33
hi CocHighlightRead guifg=#98d335 
hi CocHighlightWrite guifg=#e93491 

" Float
hi CocFloating guifg=#aa00aa
hi CocErrorFloat guifg=#ff0000
hi CocWarningFloat guifg=#ddaa00 
hi CocInfoFloat guifg=#0055DD 
hi CocHintFloat guifg=#2ed1cd
