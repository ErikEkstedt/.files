require("toggleterm").setup{}
local Terminal  = require('toggleterm.terminal').Terminal

-- TODO: add escape as quit?
local lazygit = Terminal:new({
  cmd = "lazygit", 
  hidden = true,
  direction = "float",
  float_opts = {
    border = "single",
    height = math.floor(vim.o.lines * .8),
    width = math.floor(vim.o.columns * .8),
  },
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
