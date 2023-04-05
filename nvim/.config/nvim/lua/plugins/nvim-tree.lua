return {
  "kyazdani42/nvim-tree.lua",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", {noremap = true, silent = true})
    require("nvim-tree").setup {}
  end
}
