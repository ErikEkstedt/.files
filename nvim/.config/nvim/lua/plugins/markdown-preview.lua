-- MarkdownPreviewToggle

vim.g.mkdp_auto_close = 0

if vim.loop.os_uname()["sysname"] == "Linux" then
  vim.g.mkdp_browser = "brave-browser"
else
  vim.g.mkdp_browser = "brave"
end
vim.api.nvim_set_keymap("n", "<Leader><S-c>", "<Plug>MarkdownPreviewToggle", {silent = false})
-- vim.api.nvim_set_keymap('n', '<Leader>c', '<Plug>MarkdownPreviewToggle')
