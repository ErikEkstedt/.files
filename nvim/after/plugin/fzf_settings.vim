" FZF

if !exists('g:loaded_fzf')
  finish
endif

let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --hidden --color=always'
let $FZF_DEFAULT_COMMAND .= ' -E .git -E "*.png" -E "*.gif" -E "*.jpg" -E ".jpeg" -E ".mp4"'
let $FZF_DEFAULT_OPTS .= ' --ansi --margin=1,1'
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
" Syntax Highlight in Previews (requires bat)
" let g:fzf_files_options = '--preview "bat --theme base16 --style numbers,grid --color always {} 2> /dev/null"'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7, 'highlight': 'Comment' }}
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-l': 'vsplit',
            \ 'ctrl-j': 'split',
            \ 'ctrl-o': 'edit',
            \ 'Enter': 'edit'}

"""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""
" fg:       text (not directories)
" fg+:      the text of filename of the currently chosen entry
" bg:       background (guibg in highlight group used)
" bg+:      background of pointer area to the left and background for cursor row
" hl:       the matching letters in files 
" hl+:      the matching letter on the currently chosen entry
" info:     color on the number of entries
" border:   the border (not the window border)
" prompt:   text before search keys
" pointer:  '>' the little pointer
" marker:   selected files marker
" spinner:  the moving spinner indicating searching
" header:   dont know now
" hi FZFBGOneDark guibg='#3b404c'

let g:fzf_colors = {
      \ 'bg+': ['bg', 'Normal'], 
      \ 'hl': ['fg', 'String'], 
      \ 'hl+': ['fg', 'String'], 
      \ 'pointer': ['fg', 'Statement'], 
      \ 'prompt': ['fg', 'Statement']}


"""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/bundle/fzf.vim/bin/preview.sh {}']}, <bang>0)
command! -bang -nargs=* Lines call fzf#vim#lines(<q-args>, {'options': ['--layout=reverse']}, <bang>0)
command! -bang -nargs=* BLines call fzf#vim#buffer_lines(<q-args>, {'options': ['--layout=reverse']}, <bang>0)
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

nnoremap <Leader>fl :BLines<CR>
nnoremap <Leader>ll :Lines<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <Leader>fw :Rg<CR>
nnoremap <Leader>fa :RgHome<CR>

nnoremap <Leader>he :Helptags<CR>
nnoremap <Leader>fs :Snippets<CR>
nnoremap <Leader>ma :Maps<CR>

" Insert mode completion
imap <c-k> <plug>(fzf-complete-word)
imap <c-j> <plug>(fzf-complete-path)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
