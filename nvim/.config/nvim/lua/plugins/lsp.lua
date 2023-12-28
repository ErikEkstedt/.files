return {
  {
    "L3MON4D3/LuaSnip",
    keys = {
      -- {
      --   "<C-l>",
      --   function()
      --     return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-l>"
      --   end,
      --   expr = true,
      --   silent = true,
      --   mode = "i",
      -- },
      -- {
      --   "<C-l>",
      --   function()
      --     require("luasnip").jump(1)
      --   end,
      --   mode = "s",
      -- },
      -- {
      --   "<C-h>",
      --   function()
      --     require("luasnip").jump(-1)
      --   end,
      --   mode = { "i", "s" },
      -- },
    },
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
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "stylua")
      table.insert(opts.ensure_installed, "shfmt")
      table.insert(opts.ensure_installed, "pyright")
      table.insert(opts.ensure_installed, "ruff-lsp")
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
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            pyright = {
              disableLanguageServices = true,
              disableOrganizeImports = true,
            },
            python = {
              venvPath = vim.fn.expand("$HOME/miniconda3/envs"),
              pythonPath = vim.g.python3_host_prog,
              analysis = {
                useLibraryCodeForTypes = false,
                diagnosticMode = "openFilesOnly",
                autoSearchPaths = false,
              },
            },
          },
        },
        ruff_lsp = {
          settings = {
            root_dir = [[root_pattern(".git")]],
          },
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
}
