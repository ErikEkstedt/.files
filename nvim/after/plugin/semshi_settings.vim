" https://github.com/numirias/semshi

if !g:semshi#active
  finish
endif

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
function! SemshiOnedarkHighlights()
  hi pythonConditional     ctermfg=214 guifg=#941faf
  hi pythonFunction        ctermfg=214 guifg=#ad36ff
  hi pythonInclude         ctermfg=214 guifg=#ff00e6 gui=bold
  hi pythonStatement       ctermfg=214 guifg=#ff00e6 gui=bold
  hi semshiAttribute       ctermfg=49  guifg=#cd1a79
  hi semshiBuiltin         ctermfg=207 guifg=#ff8a00
  hi semshiErrorChar       ctermfg=231 guifg=#ffffff guibg=#fb6000
  hi semshiErrorSign       ctermfg=231 guifg=#aa1188 guibg=None
  hi semshiFree            ctermfg=218 guifg=#ffafd7
  hi semshiGlobal          ctermfg=214 guifg=#ffaf00
  hi semshiImported        ctermfg=214 guifg= #6bef0c gui=bold
  hi semshiLocal           ctermfg=209 guifg=#ff875f
  hi semshiParameter       ctermfg=75  guifg=#ff0087
  hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
  " hi semshiSelected        ctermfg=231 guibg=#48505c guifg=#1ef944
  hi semshiSelf            ctermfg=249 guifg=#04d377
  hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
endfunction

function! SemshiHighlightsNord()
  " let s:nord0_gui = "#2E3440"
  " let s:nord1_gui = "#3B4252"
  " let s:nord2_gui = "#434C5E"
  " let s:nord3_gui = "#4C566A"
  " let s:nord3_gui_bright = "#616E88"
  " let s:nord4_gui = "#D8DEE9"
  " let s:nord5_gui = "#E5E9F0"
  " let s:nord6_gui = "#ECEFF4"
  " let s:nord7_gui = "#8FBCBB"
  " let s:nord8_gui = "#88C0D0"
  " let s:nord9_gui = "#81A1C1"
  " let s:nord10_gui = "#5E81AC"
  " let s:nord11_gui = "#BF616A"
  " let s:nord12_gui = "#D08770"
  " let s:nord13_gui = "#EBCB8B"
  " let s:nord14_gui = "#A3BE8C"
  " let s:nord15_gui = "#B48EAD"
  hi pythonConditional      guifg=#B48EAD
  hi pythonFunction         guifg=#81A1C1
  hi pythonInclude          guifg=#5E81AC gui=bold
  hi pythonStatement        guifg=#5E81AC gui=bold
  hi semshiAttribute        guifg=#8FBCBB
  hi semshiBuiltin          guifg=#e8b5e1
  hi semshiErrorChar        guifg=#ffffff guibg=#fb6000
  hi semshiErrorSign        guifg=#aa1188 guibg=None
  hi semshiFree             guifg=#ffafd7
  hi semshiGlobal           guifg=#88C0D0
  hi semshiImported         guifg=#81A1C1 gui=bold
  hi semshiLocal            guifg=#ff875f
  hi semshiParameter        guifg=#88C0D0
  hi semshiParameterUnused  guifg=#87d7ff cterm=underline gui=underline
  hi semshiSelf             guifg=#EBCB8B
  hi semshiUnresolved       guifg=#ffff00 cterm=underline gui=underline
endfunction

function! SemshiColors() "{{{
  sign define semshiError text=⚠ texthl=semshiErrorSign
  if g:colors_name =~ 'nord'
    call SemshiHighlightsNord()
  elseif g:colors_name =~ 'onedark'
    call SemshiOnedarkHighlights()
  endif
endfunc  "}}}

augroup Semshi
	autocmd!
  autocmd FileType python call SemshiColors()
  autocmd ColorScheme * call SemshiColors()
augroup END
