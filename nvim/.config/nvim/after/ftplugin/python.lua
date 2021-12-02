local key_map = vim.api.nvim_set_keymap
local buf_key_map = vim.api.nvim_buf_set_keymap
local km = {noremap = true, silent = true}

if vim.g.loaded_slime then
  buf_key_map(0, "n", "<CR>", "<Plug>SlimeParagraphSend", {silent = true})
  buf_key_map(0, "x", "<CR>", "<Plug>SlimeParagraphSend", {silent = true})
end

key_map("n", "<Space>al", "gg0v/if __name__<CR>k", km)
key_map("n", "gm", "/if __name__<CR>j", km)
