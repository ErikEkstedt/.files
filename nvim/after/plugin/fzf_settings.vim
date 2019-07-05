" FZF
" Functions and Autocommands  "{{{


" Ripgrep
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --hidden --smart-case '.shellescape(<q-args>), 1,
	\   fzf#vim#with_preview('right:50%'),
	\   <bang>0)


" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, 'number', 'no')

  let height = float2nr(&lines/2)
  let width = float2nr(&columns - (&columns * 2 / 10))
  "let width = &columns
  let row = float2nr(&lines / 3)
  let col = float2nr((&columns - width) / 3)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height':height,
        \ }
  let win =  nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  call setwinvar(win, '&relativenumber', 0)
endfunction


" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = ' --preview "rougify {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' ,
        \ 'window': 'call FloatingFZF()'})
endfunction


" Hide status in fzf
" autocmd! FileType fzf
" autocmd FileType fzf set laststatus=0 noshowmode noruler
"       \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 guibg=#424957 guifg=#39ff00
  highlight fzf2 guibg=#424957 guifg=#e511dd
  highlight fzf3 guibg=#424957 guifg=#ff9c00
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

"}}}

" settings {{{
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Default fzf layout
" let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-l': 'vsplit',
            \ 'ctrl-j': 'split',
            \ 'ctrl-o': 'edit',
            \ 'Enter': 'edit'}

" Customize fzf colors to match your color scheme
let g:fzf_colors = { 
			\ 'fg':			 ['fg', 'Normal'],
			\ 'bg':      ['bg', 'NormalFloat'],
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


" Syntax Highlight in Previews

" requires bat
let g:fzf_files_options = '--color "border:#FF02F5,bg:#000000,bg+:#000000,info:#aa00FF" --preview "bat --color always {}"'

" requires highlight (sudo apt install highlight)
" let g:fzf_files_options = '--color "border:#FF02F5,info:#aa00FF" --preview "highlight -O ansi --force {} 2> /dev/null"'

"}}}


" Mappings {{{
" FuzzyFind files in root /, $HOME or current folder
nnoremap <Leader>fr :Files /<CR>
nnoremap <Leader>fi :Files ~/<CR>
nnoremap <Leader>fl :Files<CR>
nnoremap <Leader>gi :GFiles<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>bu :Buffers<CR>

" FuzzyFind files in predefined folders I commonly use
nnoremap <Leader>fc :Files ~/.files<CR>
nnoremap <Leader>fno :Files ~/Notes<CR>
nnoremap <Leader>fp :Files ~/phd<CR>

" Others
nnoremap <Leader>ff :Rg<CR>
nnoremap <Leader>li :Lines<CR>

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

