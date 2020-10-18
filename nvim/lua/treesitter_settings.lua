local nvim_ts = require('nvim-treesitter')
local configs = require('nvim-treesitter.configs')

configs.configs.setup {
  ensure_installed = {"python", "markdown"},     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}
