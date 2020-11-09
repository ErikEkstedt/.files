" FZF

if !exists('g:loaded_fzf')
  finish
endif

" let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --hidden --no-ignore'
let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --no-ignore'
let $FZF_DEFAULT_COMMAND .= ' -E .git'
let $FZF_DEFAULT_COMMAND .= ' -E node_modules'
let $FZF_DEFAULT_COMMAND .= ' -E "data/**/*.json"'
let $FZF_DEFAULT_COMMAND .= ' -E "__pycache*"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.png" -E "*.gif" -E "*.jpg" -E ".jpeg" -E "*.svg"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.wav" -E "*.sph" -E "*.mp3" -E ".mp4"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.pt" -E "*.npy"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.spl" -E "*.sug"'

" Minimu trying fzf-preview
let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7, 'highlight': 'Comment' }}
let g:fzf_command_prefix = 'FZF'
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

" when searching for text in files omit json, txt, csv files
command! -bang -nargs=* FZFMyRg
      \ call fzf#vim#grep(
      \    'rg --iglob "!*.txt" --iglob "!*.json" --glob "!*.csv" --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \     fzf_preview#p(<bang>0, {'options': '--delimiter : --nth 3..'}),
      \     <bang>0
      \)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - FZF/FZFFiles: Search files with previewing file content.
" - FZFLocate: Use your system's file database to search files with previewing file content.
" - FZFGGrep: Use git grep to search your file content and preview the context of lines.
" - FZFGrep: Use grep to search your file content and preview the context of lines.
" - FZFAg: Use silversearcher-ag to search your file content and preview the context of lines.
" - FZFRg: Use ripgrep to search your file content and preview the context of lines.
" - FZFHistory: Browse edited files in vim's history list with previewing file content.
" - FZFBLines: Search all lines of the current buffer and previewing their context.
" - FZFTags: Search all the tags in vim's tags and previewing their context.
" - FZFBTags: Search all the tags of the current buffer and previewing their context.
" - FZFMarks: Search all the positions of vim's marks and preview their context.
" - FZFWindows: Search all the vim's windows and preview their content.
" - FZFQuickFix/FZFLocList': Search VIM's QuickFix/LocList entries with preview!
"
" - Differences between Current fzf.vim's Builtin Commands with preview
" - All comands support pressing ? to toggle preview.
" - The original Ag and Rg commands will also do fuzzy match on file names, which is annoying sometimes. Here they would only match lines.
" - FZFGGrep, FZFGrep: Use git grep and grep to search file content, which the original fzf.vim doesn't provide.
" - FZFBLines, FZFTags, FZFMarks and FZFWindows: The original fzf.vim does not support preview with those.
" - FZFQuickFix/FZFLocList: The original fzf.vim does not provide these commands.
" - FuzzyFind files in root /, $HOME or current folder

nnoremap <Leader>fp :FZFFiles ~/projects<CR>
nnoremap <Leader>fi :FZFFiles ~<CR>
nnoremap <Leader>ff :FZFFiles<CR>
nnoremap <Leader>fc :FZFFiles ~/.files<CR>

" Search lines in current buffer
nnoremap <Leader>ll :FZFBLines<CR>
" Search lines in all buffers
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>wo :Lines<CR>
nnoremap <Leader>bu :Buffers<CR>

nnoremap <C-f> :FZFMyRg<CR>
nnoremap <Leader>fw :FZFMyRg<CR>

nnoremap <Leader>gi :FZFGGrep<CR>
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>fG :GFiles<CR>

" nnoremap <Leader>fr :Files /<CR>
" nnoremap <Leader>fi :Files ~<CR>
" nnoremap <Leader>ff :Files<CR>
" nnoremap <Leader>fg :GFiles<CR>
" nnoremap <Leader>gs :GFiles?<CR>

" FuzzyFind files in predefined folders I commonly use
" nnoremap <Leader>fc :Files ~/.files<CR>
" nnoremap <Leader>fp :Files ~/phd<CR>

" nnoremap <Leader>ll :Lines<CR>
" nnoremap <C-f> :Rg<CR>
" nnoremap <Leader>fw :Rg<CR>
" nnoremap <Leader>fa :RgHome<CR>

" Help can not open in split?
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

"" Hide status in fzf
"autocmd! FileType fzf
"autocmd FileType fzf set laststatus=0 noshowmode noruler
"      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
