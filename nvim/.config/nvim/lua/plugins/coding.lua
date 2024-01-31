return {
  -- {
  --   "echasnovski/mini.surround",
  --   opts = {
  --     custom_surroundings = {
  --       ["("] = { input = { "%b()", "^.%s*().-()%s*.$" }, output = { left = "(", right = ")" } },
  --       ["["] = { input = { "%b[]", "^.%s*().-()%s*.$" }, output = { left = "[", right = "]" } },
  --       ["{"] = { input = { "%b{}", "^.%s*().-()%s*.$" }, output = { left = "{", right = "}" } },
  --       ["<"] = { input = { "%b<>", "^.%s*().-()%s*.$" }, output = { left = "<", right = ">" } },
  --     },
  --   },
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "KabbAmine/vCoolor.vim",
    config = function()
      vim.g.vcoolor_disable_mappings = 1
      vim.keymap.set("n", "<space>cc", ":VCoolor<CR>", { silent = true, desc = "Pick colors" })
    end,
  },
}
