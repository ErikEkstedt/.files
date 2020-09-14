" https://github.com/nvim-lua/completion-nvim
if !exists('g:nvim_lsp')
  finish
endif

let g:completion_trigger_on_delete = 1

" nnoremap <silent> gh <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Use completion-nvim in every buffer
set completeopt=menuone,noinsert,noselect  " noi

" autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_confirm_key = "\<leader>\<leader>"
let g:completion_enable_auto_paren = 1
" let g:completion_customize_lsp_label = {
"       \ 'Function': "\uf794",
"       \ 'Method': "\uf6a6",
"       \ 'Variable': "\uf71b",
"       \ 'Constant': "\uf8ff",
"       \ 'Struct': "\ufb44",
"       \ 'Class': "\uf0e8",
"       \ 'Interface': "\ufa52",
"       \ 'Text': "\ue612",
"       \ 'Enum': "\uf435",
"       \ 'EnumMember': "\uf02b",
"       \ 'Module': "\uf668",
"       \ 'Color': "\ue22b",
"       \ 'Property': "\ufab6",
"       \ 'Field': "\uf93d",
"       \ 'Unit': "\uf475",
"       \ 'File': "\uf471",
"       \ 'Value': "\uf8a3",
"       \ 'Event': "\ufacd",
"       \ 'Folder': "\uf115",
"       \ 'Keyword': "\uf893",
"       \ 'Operator': "\uf915",
"       \ 'Reference': "\uf87a",
"       \ 'Snippet': "\uf64d",
"       \ 'TypeParameter': "\uf278",
"       \ 'Default': "\uf29c",
"       \}
