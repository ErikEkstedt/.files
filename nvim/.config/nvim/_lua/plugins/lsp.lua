return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load() -- required for luasnip + friendly-snippets
      local ls = require("luasnip")
      local types = require("luasnip.util.types")
      local snippet = ls.snippet
      local i = ls.insert_node
      local f = ls.function_node
      local fmt = require("luasnip.extras.fmt").fmt
      ls.add_snippets("python", {
        ls.parser.parse_snippet("printshape", 'print("${1}: ", tuple(${1}.shape))'),
        ls.parser.parse_snippet("printdict", 'for k, v in ${1}.items():\n\tprint(f"{k}: {v}")'),
        ls.parser.parse_snippet("fig", "fig, ax = plt.subplots(${1:1}, ${2:1})"),
        ls.parser.parse_snippet("ifmain", 'if __name__ == "__main__":'),
      })
      ls.config.setup({
        region_check_events = "InsertEnter",
        delete_check_events = "TextChanged,InsertLeave",
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "", "Statement" } },
            },
          },
          [types.insertNode] = {
            active = {
              virt_text = { { "", "Character" } },
            },
          },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-l>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            -- expand the snippet if available or jump to the next snippet location
            luasnip.expand_or_jump()
          elseif cmp.visible() then
            -- otherwise function as the enter key and select
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable(-1) then
            luasnip.expand_or_jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      opts.experimental = {
        ghost_text = false,
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "copilot" then
              copilot_cmp._on_insert_enter({})
            end
          end)
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 500,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "pyright")
      -- table.insert(opts.ensure_installed, "pylyzer")
    end,
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   optional = false,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = opts.sources or {}
  --     table.insert(opts.sources, nls.builtins.formatting.black)
  --   end,
  -- },
  -- {
  --   "stevearc/conform.nvim",
  --   optional = true,
  --   opts = {
  --     formatters_by_ft = {
  --       ["python"] = { "black" },
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          prefix = "icons",
        },
      },
      servers = {
        -- Pylyzer is fast but don't support .venv/conda environments
        -- pylyzer = {
        --   python = {
        --     checkOnType = false,
        --     diagnostics = true,
        --     inlayHints = true,
        --     smartCompletion = true,
        --   },
        -- },
        pyright = {
          settings = {
            python = {
              venvPath = vim.fn.expand("$HOME/miniconda3/envs"),
              pythonPath = vim.g.python3_host_prog,
            },
          },
        },
        -- ruff_lsp = function()
        --   return {}
        -- end,
        --   ruff_lsp = {
        --     settings = {
        --       root_dir = [[root_pattern(".git")]],
        --     },
        --     keys = {
        --       {
        --         "<leader>co",
        --         function()
        --           vim.lsp.buf.code_action({
        --             apply = true,
        --             context = {
        --               only = { "source.organizeImports" },
        --               diagnostics = {},
        --             },
        --           })
        --         end,
        --         desc = "Organize Imports",
        --       },
        --     },
        --   },
        -- },
        -- setup = {
        --   ruff_lsp = function()
        --     require("lazyvim.util").lsp.on_attach(function(client, _)
        --       if client.name == "ruff_lsp" then
        --         -- Disable hover in favor of Pyright
        --         client.server_capabilities.hoverProvider = false
        --       end
        --     end)
        --   end,
      },
    },
  },
}
