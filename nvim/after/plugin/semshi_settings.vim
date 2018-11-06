" https://github.com/numirias/semshi


" Mappings
" nmap <silent> <leader>rr :Semshi rename<CR>

" nmap <silent> <Tab> :Semshi goto name next<CR>
" nmap <silent> <S-Tab> :Semshi goto name prev<CR>

" nmap <silent> <leader>c :Semshi goto class next<CR>
" nmap <silent> <leader>C :Semshi goto class prev<CR>

" nmap <silent> <leader>f :Semshi goto function next<CR>
" nmap <silent> <leader>F :Semshi goto function prev<CR>

" nmap <silent> <leader>ee :Semshi error<CR>
" nmap <silent> <leader>ge :Semshi goto error<CR>


" Highlight
function MyCustomHighlights()
  hi semshiLocal           ctermfg=209 guifg=#ff875f
  hi semshiGlobal          ctermfg=214 guifg=#ffaf00
  hi semshiImported        ctermfg=214 guifg=#44faf6 cterm=bold gui=bold
  hi semshiParameter       ctermfg=75  guifg=#5fafff
  hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
  hi semshiFree            ctermfg=218 guifg=#ffafd7
  hi semshiBuiltin         ctermfg=207 guifg=#ff8a00
  hi semshiAttribute       ctermfg=49  guifg=#00ffaf
  hi semshiSelf            ctermfg=249 guifg=#be5898
  hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
  hi semshiSelected        ctermfg=231 guifg=#ffffff guibg=#f600c3
  hi semshiErrorSign       ctermfg=231 guifg=#ffffff guibg=#ff0000
  hi semshiErrorChar       ctermfg=231 guifg=#ffffff guibg=#fb6000
  sign define semshiError text=E> texthl=semshiErrorSign
endfunction


augroup Semshi
	autocmd!
  autocmd FileType python call MyCustomHighlights()
  autocmd ColorScheme * call MyCustomHighlights()
augroup END
