-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    local km = { noremap = true, silent = true }
    vim.keymap.set("n", "<Space>al", "gg0v/if __name__<CR>k", km)
    vim.keymap.set("n", "gm", "/if __name__<CR>:nohl<CR>j", km)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "bash", "zsh" },
  callback = function()
    -- TODO: conditional to make sure vim-slime is installed
    vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend", {})
    vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", {})
  end,
})
