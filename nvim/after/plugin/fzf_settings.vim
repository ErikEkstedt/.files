" FZF

" let $FZF_DEFAULT_OPTS=' --layout=reverse --margin=1,4'

" Mapping
" FuzzyFind files in root /, $HOME or current folder
nnoremap <Leader>fr :Files /<CR>
nnoremap <Leader>Fr :Files! /<CR>
nnoremap <Leader>FR :Files! /<CR>

nnoremap <Leader>fi :Files ~/<CR>
nnoremap <Leader>Fi :Files! ~/<CR>
nnoremap <Leader>FI :Files! ~/<CR>

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>Ff :Files!<CR>
nnoremap <Leader>FF :Files!<CR>

nnoremap <Leader>fb :Buffers<CR>

nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>gs :GFiles?<CR>

" FuzzyFind files in predefined folders I commonly use
nnoremap <Leader>fc :Files ~/.files<CR>
nnoremap <Leader>fno :Files ~/Notes<CR>
nnoremap <Leader>fp :Files ~/phd<CR>

" Others
" nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fl :LinesWithPreview<CR>
nnoremap <Leader>fw :Rg<CR>
nnoremap <Leader>FW :Rg!<CR>
nnoremap <Leader>FA :RgHome!<CR>
nnoremap <Leader>fa :RgHome<CR>

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

" settings {{{
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Syntax Highlight in Previews (requires bat)
let g:fzf_files_options = '--preview "bat --theme zenburn  --color always {} 2> /dev/null"'

" Default fzf layout
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-l': 'vsplit',
            \ 'ctrl-j': 'split',
            \ 'ctrl-o': 'edit',
            \ 'Enter': 'edit'}

" " Customize fzf colors to match your color scheme
hi FZFFloat guibg=#222432 guifg=#98d335
hi FZFBorder guifg=#00b3fb
hi FZFPointer guifg=#fecc66
let g:fzf_colors = {
			\ 'fg':			 ['fg', 'Normal'],
			\ 'bg':      ['bg', 'FZFFloat'],
			\ 'hl':      ['fg', 'FZFFloat'],
			\ 'fg+':     ['fg', 'CursorLine', 'Normal', 'Normal'],
			\ 'bg+':     ['bg', 'FZFFloat'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'Comment'],
			\ 'border':  ['fg', 'FZFBorder'],
			\ 'prompt':  ['fg', 'Statement'],
			\ 'pointer': ['fg', 'Statement'],
			\ 'marker':  ['fg', 'FZFPointer'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }
"}}}

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, 'number', 'no')

  let height = float2nr(&lines/2)
  let width = float2nr(&columns - (&columns * 8 / 100))
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


command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}),
    \   <bang>0)

" ripgrep freezez if adding --no-ignore flag 
" TODO: turn these into a general function that takes in one argument dir -
" the directory to search in.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --hidden --color=always --smart-case 2> /dev/null '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}),
  \   <bang>0)

command! -bang -nargs=* RgHome
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --hidden --color=always --glob "!.yarn*" --smart-case 2> /dev/null '.shellescape(<q-args>), 
  \   1,
  \   fzf#vim#with_preview({'dir': '~'}),
  \   <bang>0)

" Hide status in fzf
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
