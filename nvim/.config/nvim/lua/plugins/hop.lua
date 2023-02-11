return {
  "phaazon/hop.nvim",
  branch = "v2", -- optional but strongly recommended
  config = function()
    local hop = require("hop")
    local HintDirection = require("hop.hint").HintDirection
    vim.keymap.set(
      "n",
      "<space>j",
      function()
        hop.hint_lines_skip_whitespace({direction = HintDirection.AFTER_CURSOR})
      end,
      {}
    )
    vim.keymap.set(
      "n",
      "<space>k",
      function()
        hop.hint_lines_skip_whitespace({direction = HintDirection.BEFORE_CURSOR})
      end,
      {}
    )
    vim.keymap.set(
      "n",
      "<space>h",
      function()
        hop.hint_words({direction = HintDirection.BEFORE_CURSOR})
      end,
      {}
    )
    vim.keymap.set(
      "n",
      "<space>l",
      function()
        hop.hint_words({direction = HintDirection.AFTER_CURSOR})
      end,
      {}
    )

    require("hop").setup({})
  end
}
