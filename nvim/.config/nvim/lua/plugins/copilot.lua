return {
  "zbirenbaum/copilot.lua",
  -- "zbirenbaum/copilot-cmp" == TODO: fix cmp source for copilot
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    vim.schedule(
      function()
        require("copilot").setup(
          {
            suggestion = {
              enabled = true,
              auto_trigger = true,
              debounce = 50,
              keymap = {
                accept = "<C-l>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>"
              }
            }
          }
        )
      end
    )
  end
}
