" FZF

" FuzzyFind files in root /, $HOME or current folder
nnoremap <Leader>fr :Files /<CR>
nnoremap <Leader>Fr :Files! /<CR>
nnoremap <Leader>FR :Files! /<CR>

nnoremap <Leader>fi :Files ~/<CR>
nnoremap <Leader>Fi :Files! ~/<CR>
nnoremap <Leader>FI :Files! ~/<CR>

nnoremap <Leader>fl :Files<CR>
nnoremap <Leader>Fl :Files!<CR>
nnoremap <Leader>FL :Files!<CR>

nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>bu :Buffers<CR>

" FuzzyFind files in predefined folders I commonly use
nnoremap <Leader>fc :Files ~/.files<CR>
nnoremap <Leader>fno :Files ~/Notes<CR>
nnoremap <Leader>fp :Files ~/phd<CR>

" Others
nnoremap <Leader>ff :Rg<CR>
nnoremap <Leader>FF :Rg!<CR>
nnoremap <Leader>FA :RgHome!<CR>
nnoremap <Leader>fa :RgHome<CR>
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

" settings {{{
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Syntax Highlight in Previews (requires bat)
let g:fzf_files_options = '--color "bg+:#000000" --preview "bat --color always {} 2> /dev/null"'

" Default fzf layout
" let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-l': 'vsplit',
            \ 'ctrl-j': 'split',
            \ 'ctrl-o': 'edit',
            \ 'Enter': 'edit'}

" let g:fzf_colors = { 'bg+': ['bg', '#000000', '#000000'] }
" " Customize fzf colors to match your color scheme
let g:fzf_colors = { 
			\ 'fg':			 ['fg', 'Normal'],
			\ 'bg':      ['bg', 'NormalFloat'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'Normal', 'Normal'],
			\ 'bg+':     ['bg', 'NormalFloat'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Comment'],
			\ 'prompt':  ['fg', '#52ff00'],
			\ 'pointer': ['fg', 'Statement'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }
"}}}

			" \ 'bg+':     ['bg', '#000000', '#000000'],

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


" Files command with preview window

"   \   'rg --column --line-number --no-heading --smart-case --hidden --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null '.shellescape(<q-args>), 1,

" TODO: turn these into a general function that takes in one argument dir -
" the directory to search in.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --no-ignore --hidden --color=always --glob "!.yarn*" --smart-case 2> /dev/null '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(),
  \   <bang>0)

command! -bang -nargs=* RgHome
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --no-ignore --hidden --color=always --glob "!.yarn*" --smart-case 2> /dev/null '.shellescape(<q-args>), 
  \   1,
  \   fzf#vim#with_preview({'dir': '~'}),
  \   <bang>0)

" \  fzf#vim#with_preview('right:50%'),

" Global line completion (not just open buffers. ripgrep required.)
" inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
"   \ 'prefix': '^.*$',
"   \ 'source': 'rg -n ^ --color always 2> /dev/null ',
"   \ 'options': '--ansi --delimiter : --nth 3..',
"   \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" Hide status in fzf
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
