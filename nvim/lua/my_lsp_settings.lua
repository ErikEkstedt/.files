-- https://github.com/neovim/nvim-lspconfig
-- checkout: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/lsp_config.lua
print('my_lsp_settings loaded!')
local nvim_lsp = require('nvim_lsp')
local completion = require('completion')
local diagnostic = require('diagnostic')

local custom_attach = function()
  completion.on_attach()
  diagnostic.on_attach()
  -- vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end
nvim_lsp.bashls.setup{on_attach=custom_attach}
nvim_lsp.vimls.setup{on_attach=custom_attach}

-- LUA
-- LspInstall sumneko_lua does not work for me?
-- Install manually: https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- breaks: Error executing vim.schedule lua callback: ...vim/bundle/completion-nvim/lua/completion/source/lsp.lua:31: attempt to call field 'parse_snippet' (a nil value)
-- nvim_lsp.sumneko_lua.setup{on_attach=custom_attach}
-- nvim_lsp.sumneko_lua.setup{on_attach=diagnostic.on_attach}

nvim_lsp.sumneko_lua.setup{
  on_attach=diagnostic.on_attach,
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        }
      }
    }
  }
}

-- nvim_lsp.bashls.setup{}
-- nvim_lsp.vimls.setup{}
-- nvim_lsp.sumneko_lua.setup{}

-- nvim_lsp.lua.setup{}
-- nvim_lsp.bashls.setup{on_attach=completion.on_attach}
-- nvim_lsp.vimls.setup{on_attach=completion.on_attach}
-- nvim_lsp.lua.setup{on_attach=completion.on_attach}

nvim_lsp.pyls_ms.setup{
  filetypes = { "python" },
  settings = {
    python = {
      condaPath = { "miniconda3/bin/conda" };
      venvPath = { "miniconda3/envs" };
      analysis = {
        disabled = {};
        errors = {};
        information = { "unresolved-import" };
      },
    };
  },
  init_options = {
    analysisUpdates = true;
    asyncStartup = true;
    interpreter = {
      properties = {
        InterpreterPath = "/home/erik/miniconda3/envs/research/bin/python",
        Version = "3.8",
      };
    };
    displayOptions = {};
  },
  on_attach=custom_attach
}
