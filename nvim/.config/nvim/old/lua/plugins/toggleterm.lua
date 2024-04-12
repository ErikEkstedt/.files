return {
  "akinsho/nvim-toggleterm.lua",
  keys = {
    {
      "<leader>gg",
      function()
        local lazygit = require("toggleterm.terminal").Terminal:new({
          cmd = "lazygit",
          hidden = true,
          direction = "float",
          float_opts = {
            border = "single",
            height = math.floor(vim.o.lines * 0.9),
          },
        })

        -- this was default in the mapping whereas the above was created in the config
        -- It seems like the terminal is not consistent across pressig "q" to exit
        -- If this is possible we should change this keymapping function
        lazygit:toggle()
      end,
      desc = "LazyGit"
    }
  },
  config = function()
    require("toggleterm").setup({})
  end,
}
