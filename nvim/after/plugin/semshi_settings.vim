" https://github.com/numirias/semshi

" Mappings
nmap <silent> <leader>rr :Semshi rename<CR>
nmap <silent> <leader>ge :Semshi goto error<CR>

" nmap <silent> <Tab> :Semshi goto name next<CR>
" nmap <silent> <S-Tab> :Semshi goto name prev<CR>

" nmap <silent> <leader>c :Semshi goto class next<CR>
" nmap <silent> <leader>C :Semshi goto class prev<CR>

" nmap <silent> <leader>f :Semshi goto function next<CR>
" nmap <silent> <leader>F :Semshi goto function prev<CR>

" nmap <silent> <leader>ee :Semshi error<CR>
" let g:semshi#error_sign_delay=2

" Highlight
function! SemshiHighlights()
  hi semshiLocal           ctermfg=209 guifg=#ff875f
  hi semshiGlobal          ctermfg=214 guifg=#ffaf00
  hi semshiImported        ctermfg=214 guifg=#7c6afd gui=bold
  hi semshiParameter       ctermfg=75  guifg=#ff0087
  hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
  hi semshiFree            ctermfg=218 guifg=#ffafd7
  hi semshiBuiltin         ctermfg=207 guifg=#ff8a00
  hi semshiAttribute       ctermfg=49  guifg=#cd1a79
  hi semshiSelf            ctermfg=249 guifg=#04d377
  hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
  hi semshiSelected        ctermfg=231 guibg=#48505c guifg=#1ef944
  hi semshiErrorSign       ctermfg=231 guifg=#ffffff guibg=#ff0000
  hi semshiErrorChar       ctermfg=231 guifg=#ffffff guibg=#fb6000
  hi semshiImported        ctermfg=214 guifg=#44faf6 gui=bold
  hi pythonInclude         ctermfg=214 guifg=#ff00e6 gui=bold
  hi pythonFunction        ctermfg=214 guifg=#ad36ff
  hi pythonStatement       ctermfg=214 guifg=#ff00e6 gui=bold
  hi pythonConditional     ctermfg=214 guifg=#941faf
  sign define semshiError text=E> texthl=semshiErrorSign
endfunction


augroup Semshi
	autocmd!
  autocmd FileType python call SemshiHighlights()
  autocmd ColorScheme * call SemshiHighlights()
augroup END
