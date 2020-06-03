" Nvim-lsp
" lua << EOF
" require'nvim_lsp'.bashls.setup{}
" require'nvim_lsp'.vimls.setup{}
" require'nvim_lsp'.pyls_ms.setup{
"   filetypes = { "python" };
"   settings = {
"     python = {
"       condaPath = { "miniconda3/bin/conda" };
"       venvPath = { "miniconda3/envs" };
"       analysis = {
"         disabled = {};
"         errors = {};
"         information = { "unresolved-import" };
"       },
"     };
"   };
"   init_options = {
"     analysisUpdates = true;
"     asyncStartup = true;
"     interpreter = {
"       properties = {
"       InterpreterPath = "/home/erik/miniconda3/envs/neovim3/bin/python",
"       Version = "3.8",
"       };
"     };
"     displayOptions = {};
"   };
" }
" EOF

" " require'nvim_lsp'.vimls.setup{on_attach=require'completion'.on_attach}
" " require'nvim_lsp'.pyls_ms.setup{on_attach=require'completion'.on_attach}

" " greg hurell
" sign define LspDiagnosticsErrorSign text=✖
" sign define LspDiagnosticsWarningSign text=⚠
" sign define LspDiagnosticsInforgmationSign text=ℹ
" sign define LspDiagnosticsHintSign text=➤

" function! s:SetUpLspHighlights()
"   execute 'highlight LspDiagnosticsError guifg=#e43a21'
"   execute 'highlight LspDiagnosticsWarning guifg=#db8d23'
"   execute 'highlight LspDiagnosticsInformation guifg=#d4d51b'
"   execute 'highlight LspDiagnosticsHint gui=bold,italic,underline guifg=#22d85e'
" endfunction

" augroup ErikLanguageClientAutocmds
"   autocmd!
"   " autocmd WinEnter * call s:Bind()
"   " autocmd FileType javascript,typescript,vim  call s:ConfigureBuffer()
"   autocmd ColorScheme * call s:SetUpLspHighlights()
" augroup END

" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gh <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" " Completion
" " Use completion-nvim in every buffer
" set completeopt=menuone,noinsert,noselect

" autocmd BufEnter * lua require'completion'.on_attach()
" let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_enable_auto_paren = 1
" " Set completeopt to have a better completion experience
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
"       \ 'Default': "\uf29c"
" filetypes = { "python" }
" init_options = {
"   analysisUpdates = true,
"   asyncStartup = true,
"   displayOptions = {},
"   interpreter = {
"     properties = {
"       InterpreterPath = "/usr/bin/python",
"       Version = "2.7"
"     }
"   }
" }
" on_new_config = <function 1>
" root_dir = vim's starting directory
" settings = {
"   python = {
"     analysis = {
"       disabled = {},
"       errors = {},
"       info = {}
"     }
"   }
" }

