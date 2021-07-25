if vim.fn.exists(vim.g.loaded_tmux_navigator) == 1 then
  return
end

vim.g.tmux_navigator_no_mappings = 1
vim.api.nvim_set_keymap("n", "<M-h>", ":TmuxNavigateLeft<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<M-j>", ":TmuxNavigateDown<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<M-k>", ":TmuxNavigateUp<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<M-l>", ":TmuxNavigateRight<CR>", {noremap = true, silent = true})
print("TmuxNavigator")
