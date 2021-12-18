-- :he vim.diagnostic
-----------------------------------------------------
-- diagnostics
-----------------------------------------------------
vim.diagnostic.config(
  {
    virtual_text = {
      prefix = "●",
      spacing = 2,
      source = "always" -- Or "if_many"
    },
    signs = true,
    underline = false,
    update_in_insert = false,
    float = {border = "single"}
  }
)
