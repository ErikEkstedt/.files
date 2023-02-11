return {
  "L3MON4D3/LuaSnip",
  config = function ()
    require("luasnip/loaders/from_vscode").lazy_load() -- required for luasnip + friendly-snippets
    local ls = require("luasnip")
    local types = require("luasnip.util.types")
    local snippet = ls.snippet
    local i = ls.insert_node
    local f = ls.function_node
    local fmt = require("luasnip.extras.fmt").fmt
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
  end
}
