return {
  "akinsho/nvim-toggleterm.lua",
  config = function()
    require("toggleterm").setup {}
    local Terminal = require("toggleterm.terminal").Terminal
    -- TODO: add escape as quit?
    local lazygit =
      Terminal:new(
      {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "single",
          height = math.floor(vim.o.lines * .9)
        }
      }
    )

    vim.keymap.set(
      "n",
      "<leader>gg",
      function()
        lazygit:toggle()
      end,
      {noremap = true, silent = true}
    )
  end
}
