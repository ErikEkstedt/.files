return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    -- cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
          -- When in diff mode, we want to use the default
          -- vim text objects c & C instead of the treesitter ones.
          local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
          local configs = require("nvim-treesitter.configs")
          for name, fn in pairs(move) do
            if name:find("goto") == 1 then
              move[name] = function(q, ...)
                if vim.wo.diff then
                  local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                  for key, query in pairs(config or {}) do
                    if q == query and key:find("[%]%[][cC]") then
                      vim.cmd("normal! " .. key)
                      return
                    end
                  end
                end
                return fn(q, ...)
              end
            end
          end
        end,
      },
    },
    config = function()
      require("ts_context_commentstring").setup({})
      vim.g.skip_ts_context_commentstring_module = true
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "prisma",
          "python",
          "regex",
          "rust",
          "typescript",
          "vim",
          "yaml",
        },
        highlight = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "<c-g><c-g>",
            node_decremental = "<c-g><c-f>",
            scope_incremental = "grm",
          },
        },
        textobjects = {
          move = {
            enable = true,
            set_jumps = true,
            goto_previous_start = {
              ["(("] = "@class.outer",
              ["{{"] = "@function.outer",
            },
            goto_next_start = {
              ["))"] = { query = "@class.outer", desc = "Next class start" },
              ["}}"] = { query = "@function.outer", desc = "Next func start" },
            },
          },
        },
        playground = { enable = true },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        -- Treesitter indent always keep to fail, working mostly in python so use indentmethod
        -- indent = {enable = true}
      })
    end,
    -- opts = {
    --   auto_install = true,
    --   highlight = { enable = true },
    --   indent = { enable = false },
    --   ensure_installed = {
    --     "bash",
    --     "c",
    --     "diff",
    --     "html",
    --     "javascript",
    --     "jsdoc",
    --     "json",
    --     "jsonc",
    --     "lua",
    --     "luadoc",
    --     "luap",
    --     "markdown",
    --     "markdown_inline",
    --     "python",
    --     "prisma",
    --     "query",
    --     "regex",
    --     "toml",
    --     "tsx",
    --     "typescript",
    --     "vim",
    --     "vimdoc",
    --     "yaml",
    --   },
    --   incremental_selection = {
    --     enable = false,
    --     keymaps = {
    --       init_selection = "<C-space>",
    --       node_incremental = "<C-space>",
    --       scope_incremental = false,
    --       node_decremental = "<bs>",
    --     },
    --   },
    --   textobjects = {
    --     move = {
    --       enable = true,
    --       goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
    --       goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
    --       goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
    --       goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
    --     },
    --   },
    -- },
  },
}
