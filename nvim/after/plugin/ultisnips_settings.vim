" UltiSnips

" Ultisnips works for vim-snippets but custom snippets does not work.
" the path i want

if g:UNAME == "Darwin"
	" let g:UltiSnipsSnippetsDir = "/Users/erik/.files/nvim/mysnips"
	" let g:UltiSnipsSnippetsDir = ["/Users/erik/.files/nvim/mysnips"]
	let g:UltiSnipsSnippetDirectories = [g:HOSTNAME . "/Users/erik/.files/nvim/mysnips","/Users/erik/.vim/bundle/vim-snippets/UltiSnips", "UltiSnips"]
else
	let g:UltiSnipsSnippetDirectories = ["/home/" . g:HOSTNAME . "/.files/nvim/mysnips","/home/erik/.vim/bundle/vim-snippets/UltiSnips", "UltiSnips"]
endif

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader><leader>'
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3
