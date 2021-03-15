" UltiSnips

if !exists('UltiSnipsEditSplit')
  finish
endif


let g:UltiSnipsSnippetDirectories = ["mysnips", "bundle/vim-snippets/UltiSnips", "UltiSnips"]

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader><leader>'
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3
