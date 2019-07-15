" Markdown Preview
" https://github.com/iamcco/markdown-preview.nvim 

if g:UNAME == "Darwin"
  let g:mkdp_browser = "brave browser"
else
  let g:mkdp_browser = "brave-browser"
endif
  

" example
nmap <space>c <Plug>MarkdownPreviewToggle

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0
