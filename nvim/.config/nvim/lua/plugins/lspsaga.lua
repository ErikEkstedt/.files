local saga = require "lspsaga"

saga.init_lsp_saga(
  {
    border_style = "round",
    use_saga_diagnostic_sign = false,
    max_preview_lines = 100,
    code_action_icon = " ",
    finder_action_keys = {
      open = "<CR>",
      vsplit = "<C-l>",
      split = "<C-j>"
    }
  }
)

--- mappings
vim.api.nvim_set_keymap(
  "n",
  "ge",
  "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua require('lspsaga.rename').rename()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap(
  "n",
  "K",
  "<cmd> lua require('lspsaga.hover').render_hover_doc()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ca",
  "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>ca",
  ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>dl",
  "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>dd",
  "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "gk",
  "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "gj",
  "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>",
  {noremap = true, silent = true}
)
-- vim.api.nvim_set_keymap("n", "gs", ":Lspsaga signature_help<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})
