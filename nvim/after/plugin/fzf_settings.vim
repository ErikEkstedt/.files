" FZF

if !exists('g:loaded_fzf')
  finish
endif

let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --hidden --color=always'
let $FZF_DEFAULT_COMMAND .= ' -E .git -E "*.png" -E "*.gif"'
let $FZF_DEFAULT_OPTS .= ' --ansi --border --margin=1,1'

" Mapping
" FuzzyFind files in root /, $HOME or current folder
nnoremap <Leader>fr :Files /<CR>
nnoremap <Leader>fi :Files ~<CR>
nnoremap <Leader>ff :Files<CR>

nnoremap <Leader>fb :Buffers<CR>

nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>gs :GFiles?<CR>

" FuzzyFind files in predefined folders I commonly use
nnoremap <Leader>fc :Files ~/.files<CR>
nnoremap <Leader>fno :Files ~/Notes<CR>
nnoremap <Leader>fp :Files ~/phd<CR>

" Others
" nnoremap <Leader>fl :Lines<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <Leader>fl :LinesNoPreview<CR>
nnoremap <Leader>fw :Rg<CR>
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
let g:fzf_files_options = '--preview "bat --theme base16 --style numbers,grid --color always {} 2> /dev/null"'

" Default fzf layout
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-l': 'vsplit',
            \ 'ctrl-j': 'split',
            \ 'ctrl-o': 'edit',
            \ 'Enter': 'edit'}

" " Customize fzf colors to match your color scheme
hi FZFFloat guibg=#222432 guifg=#646e87
hi FZFSelector guibg=#222432
hi FZFPointer guifg=#60f1ff gui=bold
hi FZFHead guibg=#222432 guifg=#519dec
hi FZFBorder guifg=#5d6677
let g:fzf_colors = {
			\ 'fg':			 ['fg', 'Normal'],
			\ 'bg':      ['bg', 'FZFFloat'],
			\ 'hl':      ['fg', 'FZFFloat'],
      \ 'fg+':     ['fg', 'FZFPointer', 'FZFPointer', 'FZFPointer'],
			\ 'bg+':     ['bg', 'FZFFloat'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'Statement'],
			\ 'border':  ['fg', 'FZFBorder'],
			\ 'prompt':  ['fg', 'FZFHead'],
			\ 'pointer': ['fg', 'FZFPointer'],
			\ 'marker':  ['fg', 'FZFPointer'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'FZFHead'] }

"}}}


function! FloatingFZF()
  let width = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
             \ 'row': (&lines - height) / 2,
             \ 'col': (&columns - width) / 2,
             \ 'width': width,
             \ 'height': height }

  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:FZFFloat')
endfunction

" " \   'rg  --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
command! -bang -nargs=* LinesNoPreview
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   <bang>0)

" command! -bang -nargs=* LinesWithPreview
"     \ call fzf#vim#grep(
"     \   'rg --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
"     \   fzf#vim#with_preview({'options': '--no-sort'}),
"     \   <bang>0)
" ripgrep freezez if adding --no-ignore flag 
" TODO: turn these into a general function that takes in one argument dir -
" the directory to search in.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

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
