-- local conf = require('lspconfig')

-- Highlight
vim.highlight.create("LspDiagnosticsVirtualTextError", {guifg = "#804A54"}, false)
vim.highlight.create("LspDiagnosticsVirtualTextWarning", {guifg = "#AE9021"}, false)
vim.highlight.link("LspDiagnosticsVirtualTextInformation", "comment", true)
vim.highlight.link("LspDiagnosticsVirtualTextHint", "comment", true)
vim.highlight.link("LspDiagnosticsSignHint", "comment", true)

-- Signs
vim.fn.sign_define(
  "LspDiagnosticsSignError",
  {text = "", texthl = "LspDiagnosticsSignError", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  {text = "", texthl = "LspDiagnosticsSignWarning", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", texthl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", texthl = "LspDiagnosticsSignHint"})

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = false,
    virtual_text = {spacing = 4},
    signs = true,
    update_in_insert = false
  }
)

-- Attach and Setup
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- shows which field you are currently on when writing function args
  require "lsp_signature".on_attach()

  -- Mappings.
  local opts = {noremap = true, silent = true}
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>fr", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";")
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {"vim"}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
      }
    }
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

-- lsp-install
local function setup_servers()
  require "lspinstall".setup()

  -- get all installed servers
  local servers = require "lspinstall".installed_servers()
  -- ... and add manually installed servers

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    elseif server == "python" then
      --[[
      **pyright was superslow and showed diagnostics on incorrect lines**
      **the settings below fixed**

      useLibraryCodeForTypes [boolean]:
      Determines whether pyright reads, parses and analyzes library
      code to extract type information in the absence of type stub files.
      Type information will typically be incomplete.
      !! WE RECOMMEND USING TYPE STUBS WHERE POSSIBLE.
      THE DEFAULT VALUE FOR THIS OPTION IS FALSE. !!
      --]]
      config = {
        settings = {
          python = {
            analysis = {
              useLibraryCodeForTypes = false
            }
          }
        }
      }
    end

    require "lspconfig"[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
