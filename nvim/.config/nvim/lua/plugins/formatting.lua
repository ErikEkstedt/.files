-- return {
--   {
--     "stevearc/conform.nvim",
--     dependencies = { "mason.nvim" },
--     lazy = true,
--     cmd = "ConformInfo",
--     keys = {
--       {
--         "<leader>cF",
--         function()
--           require("conform").format({ formatters = { "injected" } })
--         end,
--         mode = { "n", "v" },
--         desc = "Format Injected Langs",
--       },
--       {
--         "<leader>df",
--         function()
--           vim.lsp.buf.format()
--         end,
--         mode = { "n", "v" },
--         desc = "Format vim.lsp.buf",
--       },
--       {
--         "<leader>fo",
--         function()
--           require("conform").format()
--         end,
--         mode = { "n", "v" },
--         desc = "Format conform",
--       },
--     },
--     config = function()
--       require("conform").setup({
--         format_on_save = {
--           -- These options will be passed to conform.format()
--           timeout_ms = 500,
--           lsp_fallback = true,
--         },
--         formatters_by_ft = {
--           lua = { "stylua" },
--           sh = { "shfmt" },
--           -- Conform will run multiple formatters sequentially
--           python = { "black" },
--           -- Use a sub-list to run only the first available formatter
--           javascript = { "prettier" },
--           javascriptreact = { "prettier" },
--           typescript = { "prettier" },
--           typescriptreact = { "prettier" },
--           vue = { "prettier" },
--           css = { "prettier" },
--           scss = { "prettier" },
--           less = { "prettier" },
--           html = { "prettier" },
--           json = { "prettier" },
--           jsonc = { "prettier" },
--           yaml = { "prettier" },
--           markdown = { "prettier" },
--           ["markdown.mdx"] = { "prettier" },
--           ["graphql"] = { "prettier" },
--           ["handlebars"] = { "prettier" },
--         },
--       })
--     end,
--   },
-- }
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>fo",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
