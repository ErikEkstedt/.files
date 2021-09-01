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
      height = math.floor(vim.o.lines * .8),
      width = math.floor(vim.o.columns * .9)
    }
  }
)

function _lazygit_toggle()
  lazygit:toggle()
end

local lf =
  Terminal:new(
  {
    cmd = "lf",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "single",
      height = math.floor(vim.o.lines * .8),
      width = math.floor(vim.o.columns * .8)
    }
  }
)

function _lf_toggle()
  lf:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>lua _lf_toggle()<CR>", {noremap = true, silent = true})
