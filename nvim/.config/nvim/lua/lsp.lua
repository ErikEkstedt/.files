local lsp_installer = require("nvim-lsp-installer")
local notify = require("notify")
local map = vim.api.nvim_buf_set_keymap
local CmdLspBuf = "<Cmd>lua vim.lsp.buf"
local CmdDiagnostic = "<cmd>lua vim.diagnostic"
local ns = {noremap = true, silent = true}

-- Python, pyright
local venvPath = vim.fn.expand("$HOME/miniconda3/envs")
local pythonPath = vim.fn.expand("$HOME/miniconda3/bin/python")

-- https://github.com/neovim/nvim-lspconfig/wiki
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#282C34]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#282C34]]

-- Find better way to add autocommands for the specific "filetype"/file-pattern in one line
vim.api.nvim_command [[autocmd CursorHold  *.lua lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI *.lua lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved *.lua lua vim.lsp.buf.clear_references()]]

vim.api.nvim_command [[autocmd CursorHold  *.py lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI *.py lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved *.py lua vim.lsp.buf.clear_references()]]

-- vim.lsp.set_log_level("debug")
-----------------------------------------------------
-- Colors and Signs
-----------------------------------------------------
local signs = {
  Error = {text = " "},
  Warn = {text = " "},
  Hint = {text = " "},
  Info = {text = " "}
}

for type, icon in pairs(signs) do
  -- sign define DiagnosticSignError text=E texthl=DiagnosticSignError linehl= numhl=
  local hl = "DiagnosticSign" .. type
  -- local hi = string.format("highlight %s guibg=NONE guifg=%s", "Diagnostic" .. type, icon.color)
  -- vim.cmd(hi)
  vim.fn.sign_define(hl, {text = icon.text, texthl = hl, numhl = ""})
end

local border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"}
}

-- Document Highlights
local doc_highlight = {
  Text = "#18DE2D", -- LspReferenceText
  Read = "#EF84FC", -- LspReferenceRead
  Write = "#D81DC6" -- LspReferenceWrite
}
for type, color in pairs(doc_highlight) do
  local hi = string.format("highlight %s guibg=NONE guifg=%s gui=bold,underline", "LspReference" .. type, color)
  vim.cmd(hi)
end

-- Use nvim-notify to display LSP messages
vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local lvl = ({"ERROR", "WARN", "INFO", "DEBUG"})[result.type]
  notify(
    {result.message},
    lvl,
    {
      title = "LSP | " .. client.name,
      timeout = 10000,
      keep = function()
        return lvl == "ERROR" or lvl == "WARN"
      end
    }
  )
end

-----------------------------------------------------
-- nvim-cmp supports additional completion capabilities
-----------------------------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-----------------------------------------------------
-- Attach
-----------------------------------------------------
local on_attach = function(client, bufnr)
  -- shows which field you are currently on when writing function args
  require("lsp_signature").on_attach()

  -- Show borders
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})

  -- Mappings.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  map(bufnr, "n", "gd", CmdLspBuf .. ".definition()<CR>", ns)
  map(bufnr, "n", "gD", CmdLspBuf .. ".declaration()<CR>", ns)
  map(bufnr, "n", "gi", CmdLspBuf .. ".implementation()<CR>", ns)
  map(bufnr, "n", "gr", CmdLspBuf .. ".references()<CR>", ns)
  map(bufnr, "n", "gk", CmdDiagnostic .. ".goto_prev()<CR>", ns)
  map(bufnr, "n", "gj", CmdDiagnostic .. ".goto_next()<CR>", ns)
  map(bufnr, "n", "K", CmdLspBuf .. ".hover()<CR>", ns)
  map(bufnr, "n", "<C-k>", CmdLspBuf .. ".signature_help()<CR>", ns)
  map(bufnr, "n", "<leader>e", CmdLspBuf .. "tic.show_line_diagnostics()<CR>", ns)
  map(bufnr, "n", "<leader>ca", CmdLspBuf .. ".code_action()<CR>", ns)
  map(bufnr, "n", "<leader>q", CmdLspBuf .. "tic.set_loclist()<CR>", ns)
  map(bufnr, "n", "<leader>rn", CmdLspBuf .. ".rename()<CR>", ns)
  map(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", ns)
  map(bufnr, "n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], ns)

  -- Set some keybinds conditional on server capabilities
  -- [LSP] Accessing client.resolved_capabilities is deprecated, update your plugins or configuration to access
  -- client.server_capabilities instead.
  -- The new key/value pairs in server_capabilities directly match those defined in the language server protocol

  -- if client.resolved_capabilities.document_formatting then
  if client.server_capabilities.document_formatting then
    -- elseif client.resolved_capabilities.document_range_formatting then
    map(bufnr, "n", "<space>fo", CmdLspBuf .. ".formatting()<CR>", ns)
  elseif client.server_capabilities.document_range_formatting then
    map(bufnr, "n", "<space>fr", CmdLspBuf .. ".range_formatting()<CR>", ns)
  end
end

-----------------------------------------------------
-- NVIM-LSP-INSTALLER
-- https://github.com/williamboman/nvim-lsp-installer
-----------------------------------------------------
lsp_installer.on_server_ready(
  function(server)
    local opts = {
      -- enable snippet support
      capabilities = capabilities,
      -- map buffer local keybindings when the language server attaches
      on_attach = on_attach
    } --make_config()

    -- language specific config
    if server.name == "sumneko_lua" then
      opts.settings = {
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
    elseif server.name == "pyright" then
      opts.settings = {
        python = {
          analysis = {
            useLibraryCodeForTypes = false,
            diagnosticMode = "workspace",
            autoSearchPaths = false
          },
          venvPath = venvPath,
          pythonPath = pythonPath
        }
      }
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
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end
)
