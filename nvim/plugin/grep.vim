" romainl gistgrep.vim
" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3

" set grepprg=ag\ --vimgrep

" function! Grep(args)
" 	let args = split(a:args, ' ')
" 	return system(join([&grepprg, shellescape(args[0]), len(args) > 1 ? join(args[1:-1], ' ') : ''], ' '))
" endfunction

" command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<q-args>)
" command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<q-args>)

" augroup quickfix
" 	autocmd!
" 	autocmd QuickFixCmdPost cgetexpr cwindow
" 	autocmd QuickFixCmdPost lgetexpr lwindow
" augroup END


" set grepprg=rg\ --vimgrep\ --glob\ '!*{.git,node_modules,build,bin,obj,tags}'

" function! Grep(args)
"     return system(join([&grepprg, shellescape(a:args)], ' '))
" endfunction

" command! -nargs=+ -complete=file_in_path -bar Gr cgetexpr Grep(<q-args>)

" augroup quickfix
"     autocmd!
"     autocmd QuickFixCmdPost cgetexpr cwindow
" augroup END
