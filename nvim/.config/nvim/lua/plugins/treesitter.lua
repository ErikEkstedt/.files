local treesitter = require "nvim-treesitter.configs"

-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
vim.api.nvim_create_autocmd(
  {"BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter"},
  {
    group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
    callback = function()
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end
  }
)

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
