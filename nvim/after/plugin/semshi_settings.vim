" https://github.com/numirias/semshi

if !exists('g:semshi#filetypes')
  echo "semshi does not exists"
  finish
endif

augroup Semshi
  autocmd!
  autocmd FileType python call s:SemshiColors()
  autocmd ColorScheme * call s:SemshiColors()
augroup END

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

function! s:OneDark()
  " |  Color Name  |   Hex   |
  " |--------------+---------|
  " | Black        | #282c34 |
  " | White        | #abb2bf |
  " | Light Red    | #e06c75 |
  " | Dark Red     | #be5046 |
  " | Green        | #98c379 |
  " | Light Yellow | #e5c07b |
  " | Dark Yellow  | #d19a66 |
  " | Blue         | #61afef |
  " | Magenta      | #c678dd |
  " | Cyan         | #56b6c2 |
  " | Gutter Grey  | #4b5263 |
  " | Comment Grey | #5c6370 |
  hi semshiSelected        guibg=#4b5263 guifg=#abb2bf gui=bold
  " hi pythonRepeat          guifg=#61afef
  " hi pythonConditional     guifg=#941faf
  " hi pythonFunction        guifg=#5491c4
  " hi pythonInclude         guifg=#ba72d0 gui=bold
  " hi pythonStatement       guifg=#ba72d0 gui=bold
  " hi pythonString          guifg=#98c379
  hi semshiAttribute       guifg=#cd1a79
  hi semshiBuiltin         guifg=#e5c07b
  hi semshiErrorChar       guifg=#ffffff guibg=#fb6000
  hi semshiErrorSign       guifg=#ff4e00 guibg=None
  hi semshiFree            guifg=#ffafd7
  hi semshiGlobal          guifg=#61afef
  hi semshiImported        guifg=#5ec673 gui=bold
  hi semshiLocal           guifg=#ff875f
  hi semshiParameter       guifg=#ff0087
  hi semshiParameterUnused guifg=#87d7ff cterm=underline gui=underline
  hi semshiSelf            guifg=#04d377
  hi semshiUnresolved      guifg=#ff3c2c cterm=underline gui=underline
endfunction

function! s:Grubox()
  hi! semshiBuiltin guifg=#f098b0
  hi! semshiImported guifg=#fabd2f
  hi! semshiAttribute guifg=#fb4934
  hi! link semshiSelf semshiImported
  hi! link semshiSelected Visual
endfunction

function! s:TomorrowNight()
  " '#c5c8c6'
  " '#1d1f21'
  " '#373b41'
  " '#282a2e'
  " '#969896'
  " '#cc6666'
  " '#de935f'
  " '#f0c674'
  " '#b5bd68'
  " '#8abeb7'
  " '#81a2be'
  " '#5b7286'
  " '#b294bb'
  " '#4d5057'
  " hi semshiSelected        guibg=#4b5263 guifg=#abb2bf gui=bold
  hi pythonFunction        guifg=#a2cdf3
  hi pythonAttribute       guifg=#81a2be
  hi semshiImported        gui=bold guifg=#8abeb7
  hi semshiAttribute       guifg=#81a2be
  hi semshiParameter       guifg=#81a2be
  hi semshiBuiltin         guifg=#e5c07b
  hi semshiErrorChar       guifg=#ffffff guibg=#cc6666
  hi semshiErrorSign       guifg=#cc6666 guibg=None
  hi semshiGlobal          guifg=#de935f
  hi semshiFree            guifg=#b294bb
  hi semshiLocal           guifg=#b294bb
  hi semshiSelf            guifg=#de935f
  hi semshiParameterUnused guifg=#f0c674 gui=underline
  hi semshiUnresolved      guifg=#cc6666 gui=underline
  echo 'Tomorrow-Night Semshi'
endfunction

function! s:Material()
  " let s:red = '#ff5370'
  " let s:orange = '#f78c6c'
  " let s:yellow = '#ffcb6b'
  " let s:green = '#c3e88d'
  " let s:green2 = '#7f995f'
  " let s:cyan = '#89ddff'
  " let s:blue = '#82aaff'
  " let s:paleblue = '#b2ccd6'
  " let s:purple = '#c792ea'
  " let s:brown = '#c17e70'
  " let s:pink = '#f07178'
  " let s:violet = '#bb80b3'
  " #ffb3ba
  " #ffdfba
  " #ffffba
  " #baffc9
  " #bae1ff
  " #f92672
  " #a6e22e
  " #66d9ef
  " #fd971f
  " #ae81ff
  " hi semshiSelected        guibg=#4b5263 guifg=#abb2bf gui=bold
  " hi semshiAttribute       guifg=s:cyan
  hi semshiImported        gui=bold guifg=#a6e22e
  hi semshiAttribute       guifg=#a6e22e
  hi semshiSelf            guifg=#baffc9
  hi semshiBuiltin         guifg=#ffcb6b
  hi pythonString          guifg=#c3e88d
  hi pythonFunction        guifg=#66d9ef
  hi pythonStatement       guifg=#bae1ff
  hi pythonKeyword         guifg=#f92672
  hi pythonOperator        guifg=#ffcb6b
  hi pythonInclude         guifg=#f92672
  " hi semshiErrorChar       guifg=#ffffff guibg=#fb6000
  " hi semshiErrorSign       guifg=#ff4e00 guibg=None
  " hi semshiFree            guifg=#ffafd7
  " hi semshiGlobal          guifg=#61afef
  " hi semshiLocal           guifg=#ff875f
  " hi semshiParameter       guifg=#ff0087
  " hi semshiParameterUnused guifg=#87d7ff cterm=underline gui=underline
  " hi semshiUnresolved      guifg=#ff3c2c cterm=underline gui=underline
endfunction

function! s:Monokai()
  " hi semshiSelected        guibg=#4b5263 guifg=#abb2bf gui=bold
  " hi semshiAttribute       guifg=s:cyan
  hi pythonString          guifg=#E6DB74
  hi pythonInclude         guifg=#F92772
  hi pythonStatement       guifg=#ae81ff
  hi semshiImported        gui=bold guifg=#a6e22e
  hi semshiAttribute       guifg=#A1EFE4
  hi semshiSelf            guifg=#FD9720
  hi semshiParameter       guifg=#FD9720
  hi semshiBuiltin         guifg=#e73c50
  " hi pythonFunction        guifg=#66d9ef
  " hi pythonKeyword         guifg=#f92672
  " hi pythonOperator        guifg=#ffcb6b
  " hi semshiErrorChar       guifg=#ffffff guibg=#fb6000
  " hi semshiErrorSign       guifg=#ff4e00 guibg=None
  " hi semshiFree            guifg=#ffafd7
  " hi semshiGlobal          guifg=#61afef
  " hi semshiLocal           guifg=#ff875f
  " hi semshiParameterUnused guifg=#87d7ff cterm=underline gui=underline
  " hi semshiUnresolved      guifg=#ff3c2c cterm=underline gui=underline
endfunction


function! s:Nord()
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
  hi semshiSelected         guibg=#3B4252 guifg=#8FBCBB gui=bold
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


function! s:Substrata()
  " Color: base0        #191c25 ~ # Background
  " Color: base1        #20222d ~ # Slightly lighter
  " Color: base2        #272935 ~ # Much lighter
  " Color: base3        #2e313d ~ # Lightest
  " Color: base4        #3c3f4e ~ # Almost invisible
  " Color: base5        #5b5f71 ~ # Much darker
  " Color: base6        #6c6f82 ~ # Slightly darker
  " Color: base7        #b5b4c9 ~ # Foreground
  " Color: base8        #f0ecfe ~ # Lighter
  " Color: red          #cf8164 ~
  " Color: green        #76a065 ~
  " Color: yellow       #ab924c ~
  " Color: blue         #8296b0 ~
  " Color: pink         #a18daf ~
  " Color: cyan         #659ea2 ~
  " Color: light_red    #fe9f7c ~
  " Color: light_green  #92c47e ~
  " Color: light_yellow #d2b45f ~
  " Color: light_blue   #a0b9d8 ~
  " Color: light_pink   #c6aed7 ~
  " Color: light_cyan   #7dc2c7 ~
  " Color: red_wash     #2d1d16 ~
  " Color: green_wash   #1c2316 ~
  " Color: yellow_wash  #262011 ~
  hi semshiSelected         guibg=#48505c guifg=#a0b9d8 gui=bold
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


function! s:SemshiColors()
  sign define semshiError text=⚠ texthl=semshiErrorSign
  if g:colors_name =~ 'nord'
    call s:Nord()
  elseif g:colors_name =~ 'onedark'
    call s:OneDark()
  elseif g:colors_name =~ 'gruvbox'
    call s:Grubox()
  elseif g:colors_name =~ 'substrata'
    call s:Substrata()
  elseif g:colors_name =~ 'material'
    call s:Material()
  elseif g:colors_name =~ 'monokai'
    call s:Monokai()
  elseif g:colors_name =~ 'Tomorrow-Night'
    call s:TomorrowNight()
  endif
endfunc


call s:SemshiColors()
