local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
  ensure_installed = {
    "c",
    "cpp",
    "dart",
    "go",
    "html",
    "java",
    "javascript",
    "python",
    "ruby",
    "rust",
    "typescript",
    "lua"
  },
  highlight = {
    enable = true
  },
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "<C-g><C-g>",
  --     node_incremental = "<C-g><C-j>",
  --     scope_incremental = "<C-g><C-s>",
  --     node_decremental = "<C-g><C-k>"
  --   }
  -- },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s"
      }
    }
  }
  -- indent = {enable = true}
}
