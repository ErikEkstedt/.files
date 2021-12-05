local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
  ensure_installed = {
    "c",
    "cpp",
    "go",
    "html",
    "java",
    "javascript",
    "python",
    "rust",
    "typescript",
    "lua"
  },
  highlight = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "<C-g><C-g>",
  --     node_incremental = "<C-g><C-j>",
  --     scope_incremental = "<C-g><C-s>",
  --     node_decremental = "<C-g><C-k>"
  --   }
  -- },
  -- indent = {enable = true}
}
