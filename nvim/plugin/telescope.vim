
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').find_files{cwd='~/.files'}<cr>

" Too slow....
" nnoremap <leader>fi <cmd>lua require('telescope.builtin').find_files{cwd='~'}<cr>
" nnoremap <leader>fp <cmd>lua require('telescope.builtin').find_files{cwd='~/projects'}<cr>
" nnoremap <leader>ff <cmd>lua require('telescope').extensions.fzf_writer.files()<cr>
" Can't open from other directories... only starts in cwd
" nnoremap <leader>fi <cmd>lua require('telescope').extensions.fzf_writer.files({cwd='~'})<cr>
" nnoremap <leader>fp <cmd>lua require('telescope').extensions.fzf_writer.files{opts={cwd='~/projects'}}<cr>

nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>he <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fn <cmd>lua require('telescope.builtin').find_files{cwd='~/vimwiki'}<cr>

nnoremap <leader>ll <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

" Strings
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
" nnoremap <leader>fw <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fw <cmd>lua require('telescope').extensions.fzf_writer.grep()<cr>

" Git
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gbr <cmd>lua require('telescope.builtin').git_branches()<cr>

" Vim-Misc
nnoremap <leader>ma <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>mn <cmd>lua require('telescope.builtin').man_pages()<cr>
nnoremap <leader>co <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>hi <cmd>lua require('telescope.builtin').highlights()<cr>

" Misc
nnoremap <leader>rl <cmd>lua require('telescope.builtin').reloader()<cr>
