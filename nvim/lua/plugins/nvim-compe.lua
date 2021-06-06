local compe = require('compe')
local protocol = require('vim.lsp.protocol')

vim.o.completeopt='menuone,noselect'


compe.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
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


-- https://github.com/neovim/neovim/blob/ca802046bf0667b211f72330619a18fec3fea5f0/runtime/lua/vim/lsp/protocol.lua#L66
protocol.CompletionItemKind = {
  ' Text';        -- = 1
  'ƒ Method';      -- = 2;
  'ƒ Function';    -- = 3; or 
  ' Constructor'; -- = 4;
  'ƒ Field';         -- = 5;
  ' Variable';    -- = 6
  ' Module';      -- = 9;
  ' Property';    -- = 10;
  ' Unit';        -- = 11;
  ' Value';       -- = 12;
  '了Enum';        -- = 13;
  ' Keyword';     -- = 14;
  '﬌ Snippet';     -- = 15;
  ' Color';       -- = 16;
  ' File';        -- = 17;
  ' Reference';     -- = 18;
  ' Folder';      -- = 19;
  ' EnumMember';  -- = 20;
  ' Constant';    -- = 21;
  ' Struct';      -- = 22;
  'ﯓ Event';         -- = 23;
  ' Operator';      -- = 24;
  ' TypeParameter'; -- = 25;
}

vim.cmd([[
	inoremap <silent><expr> <CR>  compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
	inoremap <silent><expr> <C-e> compe#close('<C-e>')
	inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
	inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
]])
