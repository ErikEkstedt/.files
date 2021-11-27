-- local luasnip = require "luasnip"
local expand_or_jump = require("luasnip").expand_or_jump
local expand_or_jumpable = require("luasnip").expand_or_locally_jumpable
local jump = require("luasnip").jump
local lsp_expand = require("luasnip").lsp_expand
local cmp = require "cmp"

vim.o.completeopt = "menu,menuone,noselect"

-- local has_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--     return false
--   end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local mapping = {
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-e>"] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping(
    {
      i = cmp.mapping.confirm({select = true}),
      c = cmp.mapping.confirm({select = false})
    }
  ),
  -- ["<CR>"] = cmp.mapping.confirm({select = true}),
  ["<localleader><localleader>"] = cmp.mapping.confirm({select = true}),
  ["<C-k>"] = cmp.mapping(
    function(fallback)
      if expand_or_jumpable() then
        expand_or_jump()
      else
        fallback() -- The fallback function sends
      end
    end,
    {"i", "s"}
  ),
  ["<C-j>"] = cmp.mapping(
    function(fallback)
      if expand_or_jumpable() then
        jump(-1)
      else
        fallback() -- The fallback function sends
      end
    end,
    {"i", "s"}
  ),
  ["<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end,
  ["<S-Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end
}
local sources = {
  {name = "luasnip", keyword_length = 2, priority = 99},
  {name = "path"},
  {name = "nvim_lua"},
  {name = "nvim_lsp", keyword_length = 2, max_item_count = 20},
  {name = "cmdline"},
  {name = "buffer", keyword_length = 5, max_item_count = 5}
}

local formatting = {
  format = require("lspkind").cmp_format {
    menu = {
      path = "ﱮ", -- [path]
      luasnip = "", -- "[snip]",
      nvim_lsp = "ﲳ",
      nvim_lua = "", -- "[api]",
      buffer = "﬘", -- buffer = "[buf]"
      treesitter = "",
      spell = "暈"
    },
    with_text = true,
    maxwidth = 100
  }
}

cmp.setup(
  {
    snippet = {
      expand = function(args)
        lsp_expand(args.body)
      end
    },
    mapping = mapping,
    sources = sources,
    formatting = formatting,
    experimental = {
      native_menu = false,
      ghost_text = true
    },
    documentation = {
      border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
      winhighlight = "FloatBorder:DocumentNC,Normal:Normal"
    }
  }
)
-- nvim-cmp highlight groups.
vim.cmd("hi DocumentNC guifg=#F70067")

local Group = require("colorbuddy.group").Group
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles
Group.new("CmpItemAbbr", g.Comment)
Group.new("CmpItemAbbrMatch", g.Normal, nil, s.bold)
Group.new("CmpItemAbbrDeprecated", g.Error)
-- Group.new("CmpItemAbbrMatchFuzzy", g.Error.fg:dark(), nil, s.italic)
Group.new("CmpItemAbbrMatchFuzzy", g.Error)
Group.new("CmpItemKind", g.Special.fg:dark())
Group.new("CmpItemMenu", g.String)
