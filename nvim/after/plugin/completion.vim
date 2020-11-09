" https://github.com/nvim-lua/completion-nvim
if !exists('g:nvim_lsp')
  finish
endif


" Files that have associated lsp-settings should be omitted
" they are attached with completion and diagnostics
let ftToIgnore = ['python', 'lua', 'vim', 'javascript', 'typescript', 'bash']
autocmd BufEnter * if index(ftToIgnore, &ft) < 0 | lua require'completion'.on_attach()


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

let g:completion_trigger_on_delete = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_confirm_key = "\<leader>\<leader>"
let g:completion_enable_auto_paren = 1

" Configure the completion chains
let g:completion_chain_complete_list = {
      \'default' : {
      \	'default' : [
      \		{'complete_items' : ['snippet', 'lsp', 'buffers']},
      \		{'mode' : 'file'}
      \	],
      \	'comment' : [],
      \	'string' : []
      \	},
      \}


" set by steelsojka/completion-buffers
let g:completion_customize_lsp_label = {
      \ 'Buffers': "[Bu]",
      \ 'Operator': "[Op]",
      \ 'Variable': "[Var]",
      \ 'Keyword': " \xf0\x9f\x94\x91",
      \ 'Snippet': "[Snip]",
      \ 'UltiSnips': "[US]",
      \}

      " \ 'Function': "\uf794",  
      " \ 'Method': "\uf6a6",
      " \ 'Variable': "\uf71b",
      " \ 'Constant': "\uf8ff",
      " \ 'Struct': "\ufb44",
      " \ 'Class': "\uf0e8",
      " \ 'Interface': "\ufa52",
      " \ 'Text': "\ue612",
      " \ 'Enum': "\uf435",
      " \ 'EnumMember': "\uf02b",
      " \ 'Module': "\uf668",
      " \ 'Color': "\ue22b",
      " \ 'Property': "\ufab6",
      " \ 'Field': "\uf93d",
      " \ 'Unit': "\uf475",
      " \ 'File': "\uf471",
      " \ 'Value': "\uf8a3",
      " \ 'Event': "\ufacd",
      " \ 'Folder': "\uf115",
      " \ 'Keyword': "\uf893",
      " \ 'Operator': "\uf915",
      " \ 'Reference': "\uf87a",
      " \ 'Snippet': "\uf64d",
      " \ 'TypeParameter': "\uf278",
      " \ 'Default': "\uf29c",
      " \}
