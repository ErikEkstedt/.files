" LuaTree

let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default, not working on mac atm
let g:lua_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:lua_tree_auto_close = 0 "0 by default, closes the tree when it's the last window
" let g:lua_tree_follow = 1 "0 by default, this option will bind BufEnter to the LuaTreeFindFile command
" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:lua_tree_bindings = {
    \ 'edit':        'o',
    \ 'edit_vsplit': '<C-v>',
    \ 'edit_split':  '<C-x>',
    \ 'edit_tab':    '<C-t>',
    \ 'cd':          '.',
    \ 'create':      'a',
    \ 'remove':      'd',
    \ 'rename':      'mm'
    \ }

nnoremap <leader>ne :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>
nnoremap <leader>n :LuaTreeFindFile<CR>

" a list of groups can be found at `:help lua_tree_highlight`
"guifg= guibg=None gui=bold,underline
highlight link LuaTreeFolderName Identifier
highlight link LuaTreeFolderIcon Identifier
