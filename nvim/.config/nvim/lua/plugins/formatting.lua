return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
      {
        "<leader>fo",
        function()
          require("conform").format()
        end,
        mode = { "n", "v" },
        desc = "Format",
      },
    },
    config = function()
      require("conform").setup({
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          sh = { "shfmt" },
          -- Conform will run multiple formatters sequentially
          python = { "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          less = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          ["markdown.mdx"] = { "prettier" },
          ["graphql"] = { "prettier" },
          ["handlebars"] = { "prettier" },
        },
      })
    end,
  },
}
