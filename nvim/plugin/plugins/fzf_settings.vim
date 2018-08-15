" FZF
" Functions and Autocommands  "{{{

" Ripgrep
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --hidden --smart-case '.shellescape(<q-args>), 1,
	\   fzf#vim#with_preview('right:50%'),
	\   <bang>0)

"}}}
" settings {{{
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = {'down': '40%'}
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-l': 'vsplit',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-o': 'edit',
            \ 'Enter': 'edit',
            \ 'Esc': 'exit', }

" Customize fzf colors to match your color scheme
let g:fzf_colors = { 
			\ 'fg':			['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'Normal', 'Normal'],
			\ 'bg+':     ['bg', 'Normal', 'Normal'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Question'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Statement'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

" https://github.com/junegunn/fzf/blob/master/man/man1/fzf.1#L211
let g:fzf_files_options = '--color "border:#FF02F5,info:#aa00FF" --preview "highlight -O ansi --force {} 2> /dev/null"'
"}}}
" Mappings {{{
" FuzzyFind files in root /, $HOME or current folder
nnoremap <Leader>fr :Files /<CR>
nnoremap <Leader>fi :Files ~/<CR>
nnoremap <Leader>fl :Files<CR>

" FuzzyFind files in predefined folders I commonly use
nnoremap <Leader>fc :Files ~/.files<CR>
nnoremap <Leader>fb :Files ~/blog<CR>
nnoremap <Leader>fp :Files ~/phd<CR>

" Others
nnoremap <Leader>ff :Rg<CR>
nnoremap <Leader>li :Lines<CR>
nnoremap <Leader>bu :Buffers<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>he :Helptags<CR>
nnoremap <Leader>fs :Snippets<CR>
nnoremap <Leader>ma :Maps<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}
