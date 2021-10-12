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
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "i", true)
end

vim.api.nvim_set_keymap("v", "<Tab>", ">gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", {noremap = true})

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
      ["<localleader><localleader>"] = cmp.mapping.confirm({select = true}),
      ["<C-l>"] = cmp.mapping(
        function(fallback)
          if vim.fn.pumvisible() == 1 then
            feedkey("<C-n>")
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends
          end
        end,
        {"i", "s"}
      ),
      ["<Tab>"] = cmp.mapping(
        function(fallback)
          if vim.fn.pumvisible() == 1 or has_words_before() then
            feedkey("<C-n>")
          else
            fallback() -- The fallback function sends a already mapped key.
          end
        end,
        {"i", "s"}
      ),
      ["<S-Tab>"] = cmp.mapping(
        function(_)
          if vim.fn.pumvisible() == 1 or has_words_before() then
            feedkey("<C-p>")
          else
            feedkey("<Esc><<I")
          end
        end,
        {"i", "s"}
      )
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "luasnip"},
      {name = "buffer"}
    },
    formatting = {
      format = require("lspkind").cmp_format({with_text = true, maxwidth = 100})
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

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.snippets = {
  python = {
    luasnip.parser.parse_snippet("printshape", 'print("${1:x}: ", tuple(${1:x}.shape)'),
    s(
      "printdict",
      {
        t("for k, v in "),
        i(1),
        t({".items():", "\t"}),
        t('print(f"{k}: {v}")')
      }
    ),
    luasnip.parser.parse_snippet("fig", "fig, ax = plt.subplots(${1:1}, ${2:1})")
  }
}
