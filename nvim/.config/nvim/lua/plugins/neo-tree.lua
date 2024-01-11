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
        "<leader>ee",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = { hide_dotfiles = false },
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
