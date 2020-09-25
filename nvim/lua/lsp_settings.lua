-- https://github.com/neovim/nvim-lspconfig
-- local util = require 'nvim_lsp/util'
-- local configs = require'nvim_lsp/configs'

local nvim_lsp = require('nvim_lsp')
local completion = require('completion')
local diagnostic = require('diagnostic')

-- checkout: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/lsp_config.lua
local custom_attach = function()
  completion.on_attach()
  diagnostic.on_attach()
  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

nvim_lsp.bashls.setup{on_attach=custom_attach}
nvim_lsp.vimls.setup{on_attach=custom_attach}

-- Install lsp with builtin installer or `npm install -g typescript-language-server`
-- along with `npm install -g typescript`
nvim_lsp.tsserver.setup{
  init_options = { bin_dir='$NVM_BIN'},
  on_attach=custom_attach
}

-- nvim_lsp.sumneko_lua.setup{on_attach=diagnostic.on_attach}
require('nlua.lsp.nvim').setup(require('nvim_lsp'), {
  on_attach = custom_attach,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  }
})

nvim_lsp.pyls_ms.setup{
  init_options = {
    analysisUpdates = true,
    asyncStartup = true,
    displayOptions = {},
    interpreter = {
      properties = {
        InterpreterPath = vim.loop.os_homedir() .. "/miniconda3/envs/research/bin/python",
        Version = "3.8",
      }
    }
  },
  settings = {
    python = {
      analysis = {
        disabled = {},
        errors = {},
        info = {},
        information = { "unresolved-import" },
      },
      condaPath = { vim.loop.os_homedir() .. "/miniconda3/bin/conda" },
      venvPath = { vim.loop.os_homedir() .. "/miniconda3/envs" },
    },
  },
  on_attach=custom_attach
}
