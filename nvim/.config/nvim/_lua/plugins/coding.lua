return {
  {
    "echasnovski/mini.surround",
    opts = {
      custom_surroundings = {
        ["("] = { input = { "%b()", "^.%s*().-()%s*.$" }, output = { left = "(", right = ")" } },
        ["["] = { input = { "%b[]", "^.%s*().-()%s*.$" }, output = { left = "[", right = "]" } },
        ["{"] = { input = { "%b{}", "^.%s*().-()%s*.$" }, output = { left = "{", right = "}" } },
        ["<"] = { input = { "%b<>", "^.%s*().-()%s*.$" }, output = { left = "<", right = ">" } },
      },
    },
  },
  {
    "KabbAmine/vCoolor.vim",
    config = function()
      vim.g.vcoolor_disable_mappings = 1
      vim.keymap.set("n", "<space>cc", ":VCoolor<CR>", { noremap = true, silent = true })
    end,
  },
}
