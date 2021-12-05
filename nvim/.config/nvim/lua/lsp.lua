local lsp_installer = require("nvim-lsp-installer")
local bufkeymap = vim.api.nvim_buf_set_keymap
local CmdLspBuf = "<Cmd>lua vim.lsp.buf"
local CmdDiagnostic = "<cmd>lua vim.diagnostic"
local nosil = {noremap = true, silent = true}

-- https://github.com/neovim/nvim-lspconfig/wiki
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#282C34]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#282C34]]
vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]

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

-----------------------------------------------------
-- nvim-cmp supports additional completion capabilities
-----------------------------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-----------------------------------------------------
-- Attach and Setup
-----------------------------------------------------
local on_attach = function(client, bufnr)
  -- Show borders
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})

  -- shows which field you are currently on when writing function args
  require("lsp_signature").on_attach()

  -- Mappings.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  bufkeymap(bufnr, "n", "gd", CmdLspBuf .. ".definition()<CR>", nosil)
  bufkeymap(bufnr, "n", "gD", CmdLspBuf .. ".declaration()<CR>", nosil)
  bufkeymap(bufnr, "n", "gi", CmdLspBuf .. ".implementation()<CR>", nosil)
  bufkeymap(bufnr, "n", "gr", CmdLspBuf .. ".references()<CR>", nosil)
  bufkeymap(bufnr, "n", "K", CmdLspBuf .. ".hover()<CR>", nosil)
  bufkeymap(bufnr, "n", "<C-k>", CmdLspBuf .. ".signature_help()<CR>", nosil)
  bufkeymap(bufnr, "n", "<leader>e", CmdLspBuf .. "tic.show_line_diagnostics()<CR>", nosil)
  bufkeymap(bufnr, "n", "<leader>ca", CmdLspBuf .. ".code_action()<CR>", nosil)
  bufkeymap(bufnr, "n", "<leader>q", CmdLspBuf .. "tic.set_loclist()<CR>", nosil)
  bufkeymap(bufnr, "n", "<leader>rn", CmdLspBuf .. ".rename()<CR>", nosil)
  bufkeymap(bufnr, "n", "gk", CmdDiagnostic .. ".goto_prev()<CR>", nosil)
  bufkeymap(bufnr, "n", "gj", CmdDiagnostic .. ".goto_next()<CR>", nosil)
  bufkeymap(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", nosil)
  bufkeymap(bufnr, "n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], nosil)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    bufkeymap(bufnr, "n", "<space>fo", CmdLspBuf .. ".formatting()<CR>", nosil)
  elseif client.resolved_capabilities.document_range_formatting then
    bufkeymap(bufnr, "n", "<space>fr", CmdLspBuf .. ".range_formatting()<CR>", nosil)
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
            autoSearchPaths = true
          }
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
