" UltiSnips

if !exists('UltiSnipsEditSplit')
  finish
endif

if g:UNAME == "Darwin"
	" let g:UltiSnipsSnippetsDir = "/Users/erik/.files/nvim/mysnips"
	" let g:UltiSnipsSnippetsDir = ["/Users/erik/.files/nvim/mysnips"]
	let g:UltiSnipsSnippetDirectories = [g:HOME . "/.config/nvim/mysnips", g:HOME . "/.vim/bundle/vim-snippets/UltiSnips", "UltiSnips"]
else
	let g:UltiSnipsSnippetDirectories = [g:HOME . "/.files/nvim/mysnips", g:HOME . "/.vim/bundle/vim-snippets/UltiSnips", "UltiSnips"]
endif

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader><leader>'
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3
