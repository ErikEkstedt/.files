-- This depends on 'global' executables
-- npm install -g prettier
-- npm install -g lua-fmt
-- Install black in the neovim3 conda-env:
--    pip install black
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
      }
    }
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.lua,*.py FormatWrite
augroup END
]],
  true
)
