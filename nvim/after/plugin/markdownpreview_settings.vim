
if g:UNAME == "Darwin"
  let g:mkdp_browser = "brave browser"
else
  let g:mkdp_browser = "brave-browser"
endif
  

" example
nmap <space>c <Plug>MarkdownPreviewToggle
