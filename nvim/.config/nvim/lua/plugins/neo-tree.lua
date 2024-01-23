return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
      { "MunifTanjim/nui.nvim", lazy = true },
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = { hide_dotfiles = false },
          follow_current_file = { enabled = true },
          window = {
            mappings = {
              ["l"] = "open",
              ["h"] = "open",
            },
          },
        },
      })
    end,
  },
}
