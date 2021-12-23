local buf_key_map = vim.api.nvim_buf_set_keymap

if vim.g.loaded_slime then
  buf_key_map(0, "n", "<CR>", "<Plug>SlimeParagraphSend", {silent = true})
  buf_key_map(0, "x", "<CR>", "<Plug>SlimeRegionSend", {silent = true})
end
