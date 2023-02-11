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
vim.api.nvim_set_keymap("n", "gk", CmdDiagnostic .. ".goto_prev()<CR>", ns)
vim.api.nvim_set_keymap("n", "gj", CmdDiagnostic .. ".goto_next()<CR>", ns)

-----------------------------------------------------
-- Colors and Signs
-----------------------------------------------------
local signs = {
  Error = {text = " "},
  Warn = {text = " "},
  Hint = {text = " "},
  Info = {text = " "}
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon.text, texthl = hl, numhl = ""})
end
