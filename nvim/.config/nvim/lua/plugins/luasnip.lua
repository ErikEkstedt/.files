require("luasnip/loaders/from_vscode").lazy_load() -- required for luasnip + friendly-snippets
local ls = require("luasnip")
local types = require("luasnip.util.types")
local snippet = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
-- local events = require("luasnip.util.events")
-- local get_docstring_arguments = require("custom.treesitter_snippet").get_docstring_arguments

-- local function copy(args)
--   return args[1]
-- end
--
-- local function get_docstring(args, snip)
--   local docstring = {}
--   local ft = vim.api.nvim_buf_get_option(0, "ft")
--   -- local comment = vim.api.nvim_buf_get_option(0, "comments")
--   local data = get_docstring_arguments()
--
--   -- get start comments for specific lang
--   if ft == "lua" then
--     table.insert(docstring, "--[[")
--   elseif ft == "python" then
--     table.insert(docstring, '"""')
--   else
--     print("Not implemented for ft=" .. ft)
--     return nil
--   end
--
--   table.insert(docstring, "Name: " .. data["identifier"])
--   table.insert(docstring, "Args:")
--
--   for _, p in pairs(data["params"]) do
--     if p ~= "self" then
--       table.insert(docstring, "\t" .. p .. ":")
--     end
--   end
--
--   -- get end comments for specific lang
--   if ft == "lua" then
--     table.insert(docstring, "--]]")
--   elseif ft == "python" then
--     table.insert(docstring, '"""')
--   end
--   return docstring
-- end

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
          virt_text = { { "", "Statement" } }
        }
      },
      [types.insertNode] = {
        active = {
          -- virt_text = {{"●", "Character"}}
          virt_text = { { "", "Character" } }
        }
      }
    }
  }
)

ls.add_snippets(
  "python",
  {
    ls.parser.parse_snippet("printshape", 'print("${1}: ", tuple(${1}.shape))'),
    ls.parser.parse_snippet("printdict", 'for k, v in ${1}.items():\n\tprint(f"{k}: {v}")'),
    ls.parser.parse_snippet("fig", "fig, ax = plt.subplots(${1:1}, ${2:1})"),
    ls.parser.parse_snippet("import torch", [[
import torch
import torch.nn as nn
import torch.nn.functional as F
]]   ),
    ls.parser.parse_snippet(
      "printdictshape",
      [[for k, v in ${1}.items():
    if isinstance(v, torch.Tensor):
        print(f"{k}: {tuple(v.shape)}")
    else:
        print(f"{k}: {v}")
    ]]
    )
  }
)

ls.add_snippets(
  "lua",
  {
    ls.parser.parse_snippet("dn", 'require("utils").DN(${1})'),
    ls.parser.parse_snippet("print", 'print("${1}: " .. vim.inspect(${1}))'),
    snippet("docstring", { f(get_docstring, {}), i(0) }),
    snippet(
      "req",
      fmt(
        [[local {} = require("{}")]],
        {
          f(
            function(args)
              local text = args[1][1] or ""
              local split = vim.split(text, ".", { plain = true })
              return split[#split]
            end,
            { 1 }
          ),
          i(1)
        }
      )
    )
  }
)
-- TODO: Use treesitter to find a class/function name and corresponding arguments
-- and create a docstring snippet.
