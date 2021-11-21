require("luasnip/loaders/from_vscode").lazy_load() -- required for luasnip + friendly-snippets
local ls = require "luasnip"
local snippet = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")

local function copy(args)
  return args[1]
end

local snippet_table = {}

snippet_table.python = {
  snippet(
    "printshape",
    {
      t('print("'),
      i(1),
      t(': ",'),
      t(" tuple("),
      f(copy, 1),
      t(".shape))")
    }
  ),
  snippet(
    "printdict",
    {
      t("for k, v in "),
      i(1),
      t({".items():", '\tprint(f"{k}: {v}")'})
    }
  ),
  ls.parser.parse_snippet("fig", "fig, ax = plt.subplots(${1:1}, ${2:1})")
}

snippet_table.lua = {
  snippet("dn", {t("require('utils').DN("), i(0), t(")")}),
  snippet(
    "print",
    {
      t('print("'),
      i(1),
      t(': " ..'),
      t(" vim.inspect("),
      f(copy, 1),
      t("))")
    }
  )
}
ls.snippets = snippet_table
