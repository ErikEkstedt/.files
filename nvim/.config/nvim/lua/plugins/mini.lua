return {
  "echasnovski/mini.nvim",
  config = function()
    -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md
    require("mini.align").setup({mappings = {start = "<space>a"}})
    require("mini.trailspace").setup()
    -- require("mini.pairs").setup()
    -- require("mini.surround").setup()
  end
}
