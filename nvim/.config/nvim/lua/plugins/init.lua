-- use "tpope/vim-repeat" -- NON-LUA
-- use {
--   "sudormrfbin/cheatsheet.nvim",
--   -- optional
--   requires = {
--     {"nvim-telescope/telescope.nvim"},
--     {"nvim-lua/popup.nvim"},
--     {"nvim-lua/plenary.nvim"}
--   }
-- }
-- use "junegunn/fzf.vim" -- NON-LUA
-- use {
--   "junegunn/fzf",
--   run = function()
--     vim.fn["fzf#install"]()
--   end
-- } -- NON-LUA

-- Lazy
return {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "mbbill/undotree",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "wellle/targets.vim",
  "marko-cerovac/material.nvim",
  "mg979/vim-visual-multi",
  {dir = vim.fn.stdpath("config") .. "/lua/utils.lua"},
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "dhruvmanila/telescope-bookmarks.nvim"
    },
    config = function()
      require("configs.telescope")
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "roobert/tailwindcss-colorizer-cmp.nvim",
      -- "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
      "L3MON4D3/LuaSnip", -- Snippet engine
      "rafamadriz/friendly-snippets", --snippet collections
      "onsails/lspkind-nvim" -- Pretty symbols for lsp
    },
    config = function()
      require("configs.nvim-cmp")
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "ray-x/lsp_signature.nvim",
      "kosayoda/nvim-lightbulb"
    },
    config = function()
      require("configs.diagnostic")
      require("configs.lsp")
    end
  }
}
