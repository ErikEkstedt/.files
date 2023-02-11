return {
  "lewis6991/gitsigns.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    require("gitsigns").setup {
      signs = {
        add = {hl = "GitSignsAdd", text = "│"},
        change = {hl = "GitSignsChange", text = "│"},
        delete = {hl = "GitsignsDelete", text = "│"},
        topdelete = {hl = "GitSignsDelete", text = "│"},
        changedelete = {hl = "GitSignsChange", text = "│"}
      },
      numhl = false,
      linehl = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set(
          "n",
          "<Space>gn",
          function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(
              function()
                gs.next_hunk()
              end
            )
            return "<Ignore>"
          end,
          {expr = true, buffer = bufnr}
        )
        vim.keymap.set(
          "n",
          "<Space>gp",
          function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(
              function()
                gs.prev_hunk()
              end
            )
            return "<Ignore>"
          end,
          {expr = true, buffer = bufnr}
        )
      end
    }
  end
}
