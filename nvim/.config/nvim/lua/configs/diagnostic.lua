-- :he vim.diagnostic
-----------------------------------------------------
-- Diagnostics
-----------------------------------------------------
vim.diagnostic.config(
  {
    virtual_text = {
      prefix = " ", -- "●",
      spacing = 2,
      source = "always" -- Or "if_many"
    },
    signs = true,
    underline = false,
    update_in_insert = false,
    float = {border = "single"}
  }
)

-----------------------------------------------------
-- Mappings
-----------------------------------------------------
local CmdDiagnostic = "<cmd>lua vim.diagnostic"
local ns = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>dk", CmdDiagnostic .. ".goto_prev()<CR>", ns)
vim.api.nvim_set_keymap("n", "<leader>dj", CmdDiagnostic .. ".goto_next()<CR>", ns)
vim.api.nvim_set_keymap("n", "<leader>dd", CmdDiagnostic .. ".open_float()<CR>", ns)
vim.api.nvim_set_keymap("n", "<leader>dq", CmdDiagnostic .. ".setloclist()<CR>", ns)

-----------------------------------------------------
-- Colors and Signs
-----------------------------------------------------
local signs = {
  Error = {text = " "},
  Warn = {text = " "},
  Hint = {text = "➡"},
  Info = {text = " "}
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon.text, texthl = hl, numhl = ""})
end
