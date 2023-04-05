return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag"
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "css",
        "help",
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
        "yaml"
      },
      highlight = {
        enable = true
      },
      autotag = {
        enable = true
      },
      context_commentstring = {
        enable = true
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "<c-g><c-g>",
          node_decremental = "<c-g><c-f>",
          scope_incremental = "grm"
        }
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_previous_start = {
            ["(("] = "@class.outer",
            ["{{"] = "@function.outer"
          },
          goto_next_start = {
            ["))"] = {query = "@class.outer", desc = "Next class start"},
            ["}}"] = {query = "@function.outer", desc = "Next func start"}
          }
        }
      },
      playground = {enable = true},
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite", "CursorHold"}
      }
      -- Treesitter indent always keep to fail, working mostly in python so use indentmethod
      -- indent = {enable = true}
    }
  end,
  build = ":TSUpdate"
}
