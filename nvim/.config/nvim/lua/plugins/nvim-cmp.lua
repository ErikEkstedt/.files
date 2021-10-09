require("luasnip/loaders/from_vscode").load() -- required for luasnip + friendly-snippets
local luasnip = require "luasnip"
local cmp = require "cmp"

vim.o.completeopt = "menu,menuone,noselect"

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

cmp.setup(
  {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({select = true}),
      ["<localleader><localleader>"] = cmp.mapping.confirm({select = true})
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "luasnip"},
      {name = "buffer"}
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu =
          ({
          nvim_lsp = "[LSP]",
          buffer = "[BFR]",
          path = "[PTH]",
          nvim_lua = "[LUA]"
        })[entry.source.name]
        return vim_item
      end
    }
  }
)

-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup(
  {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = false, -- automatically select the first item
    insert = false, -- use insert confirm behavior instead of replace
    map_char = {
      -- modifies the function or method delimiter by filetypes
      all = "(",
      tex = "{"
    }
  }
)

-- -- symbols for autocomplete
-- vim.lsp.protocol.CompletionItemKind = {
--   "  (Text) ",
--   "  (Method)",
--   "  (Function)",
--   "  (Constructor)",
--   " ﴲ (Field)",
--   "[](Variable)",
--   "  (Class)",
--   " ﰮ (Interface)",
--   "  (Module)",
--   " 襁(Property)",
--   "  (Unit)",
--   "  (Value)",
--   " 練(Enum)",
--   "  (Keyword)",
--   "  (Snippet)",
--   "  (Color)",
--   "  (File)",
--   "  (Reference)",
--   "  (Folder)",
--   "  (EnumMember)",
--   " ﲀ (Constant)",
--   " ﳤ (Struct)",
--   "  (Event)",
--   "  (Operator)",
--   "  (TypeParameter)"
-- }
