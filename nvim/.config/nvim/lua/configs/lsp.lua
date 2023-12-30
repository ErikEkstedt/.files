local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local map = vim.api.nvim_buf_set_keymap

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

-- Show borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border, anchor = "SW"})
-----------------------------------------------------
-- Attach
-----------------------------------------------------
local CmdLspBuf = "<Cmd>lua vim.lsp.buf"
local ns = {noremap = true, silent = true}

local lspSignatureOpts = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  doc_lines = 80,
  max_height = 40,
  max_width = 80,
  wrap = true,
  timer_interval = 100,
  handler_opts = {
    border = "rounded"
  }
}

-- local telescope = require("telescope")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_flags = {debounce_text_changes = 300}
local on_attach = function(client, bufnr)
  -- Mappings.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- https://github.com/ray-x/lsp_signature.nvim#full-configuration-with-default-values
  -- shows which field you are currently on when writing function args
  -- require("lsp_signature").on_attach(lspSignatureOpts, bufnr)
  map(bufnr, "n", "gd", CmdLspBuf .. ".definition()<CR>", ns)
  map(bufnr, "n", "gD", CmdLspBuf .. ".declaration()<CR>", ns)
  map(bufnr, "n", "gi", CmdLspBuf .. ".implementation()<CR>", ns)
  -- map(bufnr, "n", "gr", CmdLspBuf .. ".references()<CR>", ns)
  map(
    bufnr,
    "n",
    "gr",
    "<cmd>lua require('telescope.builtin').lsp_references({layout_strategy='center', layout_config={width=0.9}})<CR>",
    ns
  )
  map(bufnr, "n", "K", CmdLspBuf .. ".hover()<CR>", ns)
  map(bufnr, "n", "<C-k>", CmdLspBuf .. ".signature_help()<CR>", ns)
  -- map(bufnr, "n", "<leader>ca", CmdLspBuf .. ".code_action()<CR>", ns)
  map(bufnr, "n", "<leader>ca", ":CodeActionMenu<CR>", ns)
  map(bufnr, "n", "<leader>ca", "<cmd>CodeActionMenu<CR>", ns) -- nvim-code-action-menu
  map(bufnr, "n", "<leader>rn", CmdLspBuf .. ".rename()<CR>", ns)
  map(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", ns)
  map(bufnr, "n", "<leader>so", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", ns)
  -- format with lsp
  -- enable_format_on_save(client, bufnr)
end

require("mason").setup()
mason_lspconfig.setup(
  {
    ensure_installed = {
      "pyright",
      -- "pylyzer",
      "prismals",
      "lua_ls",
      "tsserver",
      "tailwindcss",
      "vimls"
    }
  }
)
-- "cssls",
-- "html",
-- "ruff_lsp",
-- "pylsp",
-- ---------------------
-- "pylyzer",  -- rust erg
-- pylyzer converts Python ASTs to Erg ASTs and passes them to Erg's type checker.
-- It then displays the results with appropriate modifications.
-- ---------------------
-- "yamlls"

-- :h mason-lspconfig-automatic-server-setup
-- The first entry (without a key) will be the default handler
-- and will be called for each installed server that doesn't have
-- a dedicated handler.
-- Next, you can provide a dedicated handler for specific servers.
-- For example, a handler override for the `rust_analyzer`:
mason_lspconfig.setup_handlers(
  {
    function(server_name) -- default handler (optional)
      local opts = {
        autostart = true,
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities
      }
      lspconfig[server_name].setup(opts)
    end,
    ["lua_ls"] = function(server_name)
      lspconfig[server_name].setup(
        {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
          cmd = {"pylyzer", "--server"},
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT"
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false
              }
            }
          }
        }
      )
    end,
    ["pyright"] = function(server_name)
      -- https://microsoft.github.io/pyright/#/settings?id=pyright-settings
      lspconfig[server_name].setup(
        {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = lsp_flags,
          settings = {
            pyright = {
              -- disableLanguageServices = true, # disable pyright language features if only pyls is to be used
              disableOrganizeImports = true
            },
            python = {
              venvPath = vim.fn.expand("$HOME/miniconda3/envs"),
              pythonPath = vim.g.python3_host_prog,
              analysis = {
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- "openFilesOnly"
                autoSearchPaths = false,
                autoImportCompletions = true
              }
            }
          }
        }
      )
    end
    -- ["pylyzer"] = function(server_name)
    -- This is unuseable for now because it can't use specific virtualenvs
    --   https://github.com/mtshiba/pylyzer
    --   lspconfig[server_name].setup(
    --     {
    --       on_attach = on_attach,
    --       capabilities = capabilities,
    --       flags = lsp_flags,
    --       settings = {
    --         {
    --           python = {
    --             checkOnType = true,
    --             diagnostics = false,
    --             inlayHints = false,
    --             smartCompletion = true
    --           }
    --         }
    --       }
    --     }
    --   )
    -- end
    -- ["ruff_lsp"] = function(server_name)
    --   lspconfig[server_name].setup(
    --     {
    --       on_attach = on_attach,
    --       flags = lsp_flags,
    --       capabilities = capabilities,
    --       settings = {
    --         root_dir = [[root_pattern(".git")]]
    --       }
    --     }
    --   )
    -- end,
    -- ["cssls"] = function(server_name)
    --   lspconfig[server_name].setup(
    --     {
    --       on_attach = on_attach,
    --       flags = lsp_flags,
    --       capabilities = capabilities,
    --       settings = {css = {lint = {unknownAtRules = "ignore"}}}
    --     }
    --   )
    -- end
  }
)
