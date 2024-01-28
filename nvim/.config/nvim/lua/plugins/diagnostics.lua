-- Global Diagnostic mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set("n", "<space>dp", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "<space>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>dd", vim.diagnostic.open_float, { desc = "Diagnostic Float" })
vim.keymap.set("n", "<space>qq", vim.diagnostic.setloclist, { desc = "Diagnostic LocList" })

for type, icon in pairs(require("config.icons").icons.diagnostics) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
      {
        "<leader>dp",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.diagnostic.goto_prev()
            -- local ok, err = pcall(vim.cmd.cprev)
            -- if not ok then
            --   vim.notify(err, vim.log.levels.ERROR)
            -- end
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "<leader>dn",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.diagnostic.goto_next()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
      {
        "<leader>dk",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.diagnostic.goto_prev()
            -- local ok, err = pcall(vim.cmd.cprev)
            -- if not ok then
            --   vim.notify(err, vim.log.levels.ERROR)
            -- end
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "<leader>dj",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.diagnostic.goto_next()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },
}
