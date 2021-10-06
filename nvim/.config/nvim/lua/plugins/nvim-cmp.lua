local cmp = require "cmp"

vim.o.completeopt = "menu,menuone,noselect"

cmp.setup(
  {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
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
      {name = "ultisnips"},
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
    auto_select = true, -- automatically select the first item
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
