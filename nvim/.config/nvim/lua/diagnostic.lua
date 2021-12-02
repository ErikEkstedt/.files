-- :he vim.diagnostic
-----------------------------------------------------
-- diagnostics
-----------------------------------------------------
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      prefix = "●",
      spacing = 2,
      source = "always" -- Or "if_many"
    },
    signs = true,
    underline = false,
    update_in_insert = false
  }
)
