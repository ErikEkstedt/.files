require("luasnip/loaders/from_vscode").lazy_load() -- required for luasnip + friendly-snippets
local ls = require "luasnip"
local types = require("luasnip.util.types")
local snippet = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local events = require("luasnip.util.events")

local function copy(args)
  return args[1]
end

-- I believe LuaSnip does not unlink a snippet
-- (when I think it should) which then all of a sudden
-- copies like the entire buffer and pastes it in recursively
-- I sometimes end up with a buffer (with recursive indents) of several thousand lines
-- and my LSP goes wild and freezes my whole system...
-- this might work?
-- https://github.com/L3MON4D3/LuaSnip/issues/116
-- vim.api.nvim_command([[au! TextChanged,InsertLeave * lua require'luasnip'.unlink_current_if_deleted()]])
--
-- Add virtial text to hint if you are in a choice-node or an insert node
-- for the relevant snippet
ls.config.setup(
  {
    region_check_events = "InsertEnter",
    delete_check_events = "TextChanged,InsertLeave",
    ext_opts = {
      [types.choiceNode] = {
        active = {
          -- virt_text = {{"●", "Statement"}}
          virt_text = {{"", "Statement"}}
        }
      },
      [types.insertNode] = {
        active = {
          -- virt_text = {{"●", "Character"}}
          virt_text = {{"", "Character"}}
        }
      }
    }
  }
)

local snippet_table = {}

snippet_table.python = {
  ls.parser.parse_snippet("printshape", 'print("${1}: ", tuple(${1}.shape))'),
  ls.parser.parse_snippet("printdict", 'for k, v in ${1}.items():\n\tprint(f"{k}: {v}")'),
  ls.parser.parse_snippet(
    "printdictshape",
    [[for k, v in ${1}.items():
    if isinstance(v, torch.Tensor):
        print(f"{k}: {tuple(v.shape)}")
    else:
        print(f"{k}: {v}")
    ]]
  ),
  ls.parser.parse_snippet("fig", "fig, ax = plt.subplots(${1:1}, ${2:1})")
}

snippet_table.lua = {
  ls.parser.parse_snippet("dn", 'require("utils").DN(${1})'),
  ls.parser.parse_snippet("print", 'print("${1}: " .. vim.inspect(${1}))'),
  snippet(
    "req",
    fmt(
      [[local {} = require("{}")]],
      {
        f(
          function(args)
            local text = args[1][1] or ""
            local split = vim.split(text, ".", {plain = true})
            return split[#split]
          end,
          {1}
        ),
        i(1)
      }
    )
  )
}
ls.snippets = snippet_table

-- TODO: Use treesitter to find a class/function name and corresponding arguments
-- and create a docstring snippet.
