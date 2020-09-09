" Completion: https://github.com/neovim/nvim-lsp
if !exists('g:nvim_lsp')
  finish
endif

nnoremap <silent> gh <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Quickly see whats attached to the current client
" :lua print(vim.inspect(vim.lsp.buf_get_clients()))
