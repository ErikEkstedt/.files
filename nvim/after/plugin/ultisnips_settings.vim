" UltiSnips

if !exists('UltiSnipsEditSplit')
  finish
endif


" let g:UltiSnipsSnippetDirectories = ["mysnips", "bundle/vim-snippets/UltiSnips", "UltiSnips"]
let g:UltiSnipsSnippetDirectories = ["mysnips", "UltiSnips"]

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader><leader>'
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3
