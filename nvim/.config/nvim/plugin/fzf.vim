" FZF
let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --no-ignore --hidden'
let $FZF_DEFAULT_COMMAND .= ' -E .git'
let $FZF_DEFAULT_COMMAND .= ' -E node_modules'
let $FZF_DEFAULT_COMMAND .= ' -E "data/**/*.json"'
let $FZF_DEFAULT_COMMAND .= ' -E "__pycache*"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.text" -E "*.txt" -E "*.xml" -E "*.csv" -E "*.json"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.out.tfevents*" -E "*.chkpt" -E "*.ckpt" -E "*.so"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.png" -E "*.gif" -E "*.jpg" -E ".jpeg" -E "*.svg"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.wav" -E "*.sph" -E "*.mp3" -E "*.mp4" -E "*.flac"'
let $FZF_DEFAULT_COMMAND .= ' -E "*.pt" -E "*.npy" -E "*.zip"'
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

let g:fzf_colors = {
      \ 'bg+': ['bg', 'Normal'], 
      \ 'hl': ['fg', 'String'], 
      \ 'hl+': ['fg', 'String'], 
      \ 'pointer': ['fg', 'Statement'], 
      \ 'prompt': ['fg', 'Statement']}

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" Ony using these because moving to telescope.nvim but it is slow for large directories
" nnoremap <LocalLeader>fp :FZFFiles ~/projects<CR>
nnoremap <LocalLeader>fi :FZFFiles ~<CR>
nnoremap <LocalLeader>fp :FZFFiles ~/projects<CR>
nnoremap <LocalLeader>fw :FZFRg<CR>
