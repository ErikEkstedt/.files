local lsp_installer = require("nvim-lsp-installer")

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
  local opts = {noremap = true, silent = true}

  -- Set keymaps in the Buffer: nufnr
  local function keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>", opts)
  keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
  keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  keymap("n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    keymap("n", "<space>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    keymap("n", "<space>fr", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
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
