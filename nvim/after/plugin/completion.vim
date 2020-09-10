" from: https://github.com/nvim-lua/completion-nvim
if !exists('g:loaded_completion')
  finish
endif
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_trigger_on_delete = 1
let g:completion_auto_paren = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_confirm_key = "\<leader>\<leader>"
let g:completion_enable_auto_paren = 1
let g:completion_customize_lsp_label = {
      \ 'Function': "\uf794",
      \ 'Method': "\uf6a6",
      \ 'Variable': "\uf71b",
      \ 'Constant': "\uf8ff",
      \ 'Struct': "\ufb44",
      \ 'Class': "\uf0e8",
      \ 'Interface': "\ufa52",
      \ 'Text': "\ue612",
      \ 'Enum': "\uf435",
      \ 'EnumMember': "\uf02b",
      \ 'Module': "\uf668",
      \ 'Color': "\ue22b",
      \ 'Property': "\ufab6",
      \ 'Field': "\uf93d",
      \ 'Unit': "\uf475",
      \ 'File': "\uf471",
      \ 'Value': "\uf8a3",
      \ 'Event': "\ufacd",
      \ 'Folder': "\uf115",
      \ 'Keyword': "\uf893",
      \ 'Operator': "\uf915",
      \ 'Reference': "\uf87a",
      \ 'Snippet': "\uf64d",
      \ 'TypeParameter': "\uf278",
      \ 'Default': "\uf29c",
      \}
" let g:completion_chain_complete_list = {
"     \'default' : {
"     \	'default' : [
"     \		{'complete_items' : ['lsp', 'snippet']},
"     \		{'mode' : 'file'}
"     \	],
"     \	'comment' : [],
"     \	'string' : []
"     \	},
"     \}
"     " \'vim' : [
"     " \	{'complete_items': ['snippet']},
"     " \	{'mode' : 'cmd'}
"     " \	],
"     " \'c' : [
"     " \	{'complete_items': ['ts']}
"     " \	],
"     " \'python' : [
"     " \	{'complete_items': ['ts']}
"     " \	],
"     " \'lua' : [
"     " \	{'complete_items': ['ts']}
"     " \	],
"     " \}
echo "loaded completion settings"

