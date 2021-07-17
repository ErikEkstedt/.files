local compe = require('compe')
local protocol = require('vim.lsp.protocol')

vim.o.completeopt='menuone,noselect'


compe.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = {menu='[B]'};
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    ultisnips = {menu='[US]', kind='﬌ Snippet'}; -- overwrites 'kind' automatically: https://github.com/hrsh7th/nvim-compe/blob/888d9eccfe7b9092dcbfcdfabfad601ce63f3eb5/lua/compe_ultisnips/init.lua
  };
}

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "  (Text) ",
  "  (Method)",
  "  (Function)",
  "  (Constructor)",
  " ﴲ (Field)",
  "[](Variable)",
  "  (Class)",
  " ﰮ (Interface)",
  "  (Module)",
  " 襁(Property)",
  "  (Unit)",
  "  (Value)",
  " 練(Enum)",
  "  (Keyword)",
  "  (Snippet)",
  "  (Color)",
  "  (File)",
  "  (Reference)",
  "  (Folder)",
  "  (EnumMember)",
  " ﲀ (Constant)",
  " ﳤ (Struct)",
  "  (Event)",
  "  (Operator)",
  "  (TypeParameter)",
}

vim.cmd([[
	inoremap <silent><expr> <CR>  compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
	inoremap <silent><expr> <C-e> compe#close('<C-e>')
	inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
	inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
]])
