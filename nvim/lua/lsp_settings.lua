-- https://github.com/neovim/nvim-lsp
local nvim_lsp = require'nvim_lsp'

nvim_lsp.bashls.setup{}
nvim_lsp.vimls.setup{on_attach=require'completion'.on_attach}
nvim_lsp.lua.setup{on_attach=require'completion'.on_attach}
nvim_lsp.pyls_ms.setup{on_attach=require'completion'.on_attach}
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
        InterpreterPath = "/home/erik/miniconda3/envs/neovim3/bin/python",
        Version = "3.8",
      };
    };
    displayOptions = {};
  },
  on_attach=require'completion'.on_attach,
}