local treesitter = require "nvim-treesitter.configs"

-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
-- vim.api.nvim_create_autocmd(
--   { "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" },
--   {
--     group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
--     callback = function()
--       vim.opt.foldmethod = "expr"
--       vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--     end
--   }
-- )

treesitter.setup {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "typescript",
    "vim",
    "yaml"
    -- "c",
    -- "cpp",
    -- "go",
    -- "java",
    -- "rust",
  },
  highlight = {
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
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_previous_start = {
        ["[["] = "@class.outer"
      },
      goto_next_start = {
        ["]]"] = { query = "@class.outer", desc = "Next class start" }
      }
    }
  },
  playground = { enable = true },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" }
  }
  -- Treesitter indent always keep to fail, working mostly in python so use indentmethod
  -- indent = {enable = true}
}
