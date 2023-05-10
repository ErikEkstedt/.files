-- This depends on 'global' executables
-- npm install -g prettier
-- npm install -g lua-fmt
-- Install black in the neovim3 conda-env:
--    pip install black
return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup(
      {
        logging = false,
        filetype = {
          javascript = {
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
              }
            end
          },
          javascriptreact = {
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
              }
            end
          },
          typescript = {
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
              }
            end
          },
          typescriptreact = {
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
              }
            end
          },
          yaml = {
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
              }
            end
          },
          json = {
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
              }
            end
          },
          html = {
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                stdin = true
              }
            end
          },
          lua = {
            function()
              return {
                exe = "luafmt",
                args = {"--indent-count", 2, "--stdin"},
                stdin = true
              }
            end
          },
          python = {
            function()
              return {
                exe = vim.g.python_host_bin .. "/black",
                args = {"-"},
                stdin = true
              }
            end
          },
          prisma = {
            function()
              vim.lsp.buf.format()
            end
          }
        }
      }
    )
    vim.api.nvim_exec(
      [[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.ts,*.js,*.jsx,*.tsx,*.html,*.lua,*.py FormatWrite
    augroup END
    ]],
      true
    )
    vim.api.nvim_set_keymap("n", "<Leader>fo", ":Format<cr>", {noremap = true, silent = true})
  end
}
