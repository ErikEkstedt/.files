" UltiSnips

if !exists('UltiSnipsEditSplit')
  finish
endif

if g:UNAME == "Darwin"
	let g:UltiSnipsSnippetDirectories = [g:HOME . "/.config/nvim/mysnips", g:HOME . "/.vim/bundle/vim-snippets/UltiSnips", "UltiSnips"]
else
	let g:UltiSnipsSnippetDirectories = [g:HOME . "/.files/nvim/mysnips", g:HOME . "/.vim/bundle/vim-snippets/UltiSnips", "UltiSnips"]
endif

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader><leader>'
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3
