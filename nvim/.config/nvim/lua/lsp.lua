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

-- local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
-- local enable_format_on_save = function(_, bufnr)
--   vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
--   vim.api.nvim_create_autocmd(
--     "BufWritePre",
--     {
--       group = augroup_format,
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format({ bufnr = bufnr })
--       end
--     }
--   )
-- end

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
-- vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
--   local client = vim.lsp.get_client_by_id(ctx.client_id)
--   local lvl = ({"ERROR", "WARN", "INFO", "DEBUG"})[result.type]
--   notify(
--     {result.message},
--     lvl,
--     {
--       title = "LSP | " .. client.name,
--       timeout = 5000,
--       keep = function()
--         return lvl == "ERROR" or lvl == "WARN"
--       end
--     }
--   )
-- end
-- Show borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--   vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     underline = true,
--     update_in_insert = false,
--     virtual_text = {spacing = 4, prefix = "●"},
--     severity_sort = true
--   }
-- )
-----------------------------------------------------
-- Attach
-----------------------------------------------------
local CmdLspBuf = "<Cmd>lua vim.lsp.buf"
local CmdDiagnostic = "<cmd>lua vim.diagnostic"
local ns = {noremap = true, silent = true}

local on_attach = function(client, bufnr)
  -- https://github.com/ray-x/lsp_signature.nvim#full-configuration-with-default-values
  -- shows which field you are currently on when writing function args
  require("lsp_signature").on_attach(
    {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      doc_lines = 80,
      max_height = 40,
      max_width = 80,
      wrap = true,
      timer_interval = 100,
      handler_opts = {
        border = "rounded"
      }
    },
    bufnr
  )

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
  map(bufnr, "n", "<leader>ca", "<cmd>CodeActionMenu<CR>", ns)
  map(bufnr, "n", "<leader>q", CmdLspBuf .. "tic.set_loclist()<CR>", ns)
  map(bufnr, "n", "<leader>rn", CmdLspBuf .. ".rename()<CR>", ns)
  map(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", ns)
  map(bufnr, "n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], ns)

  -- format with lsp
  -- enable_format_on_save(client, bufnr)
end

-- https://github.com/kosayoda/nvim-lightbulb#configuration
-- Show a lightbulb on a line (when the cursor is there) where a code-action is available
require("nvim-lightbulb").setup(
  {
    autocmd = {enabled = true}
  }
)
require("mason").setup()
mason_lspconfig.setup(
  {
    automatic_installation = true,
    ensure_installed = {
      "bashls",
      "cssls",
      "html",
      "pyright",
      -- "ruff_lsp",
      -- "pylsp",
      "prismals",
      "sumneko_lua",
      "tsserver",
      "tailwindcss",
      "vimls",
      "yamlls"
    }
  }
)

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_flags = {debounce_text_changes = 150}

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

      -- Could not get these settings to take effect (i.e. plugins.ruff)
      -- However installing ruff :PylspInstall pyls-ruff works
      -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md
      -- if server_name == "sumneko_lua" then
      --   -- opts.settings = {
      --   --   Lua = {
      --   --     diagnostics = {
      --   --       globals = {"vim", "print"}
      --   --     },
      --   --     workspace = {
      --   --       library = {
      --   --         [vim.fn.expand "$VIMRUNTIME/lua"] = true,
      --   --         [vim.fn.stdpath "config" .. "/lua"] = true
      --   --       }
      --   --     }
      --   --   }
      --   -- }
      -- elseif server_name == "cssls" then
      --   -- elseif server_name == "ruff_lsp" then
      --   --   opts.settings = {
      --   --     root_dir = [[root_pattern(".git")]]
      --   --   }
      --   opts.settings = {
      --     css = {
      --       lint = {unknownAtRules = "ignore"}
      --     }
      --   }
      -- print(server_name)
      -- print(vim.inspect(opts))
      print("Implicit: " .. server_name)
      lspconfig[server_name].setup(opts)
    end,
    ["sumneko_lua"] = function(server_name)
      print("Explicit: " .. server_name)
      lspconfig[server_name].setup(
        {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = {"vim", "print"}
              },
              workspace = {
                library = {
                  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                  [vim.fn.stdpath "config" .. "/lua"] = true
                }
              }
            }
          }
        }
      )
    end,
    ["pyright"] = function(server_name)
      print("Explicit: " .. server_name)
      lspconfig[server_name].setup(
        {
          on_attach = function(client, bufnr)
            print("No on attach")
          end,
          capabilities = {},
          flags = lsp_flags,
          settings = {
            disableLanguageServices = true, -- using pylsp + ruff instead [TRYING]
            python = {
              venvPath = vim.fn.expand("$HOME/miniconda3/envs"),
              pythonPath = vim.g.python3_host_prog,
              analysis = {
                useLibraryCodeForTypes = false,
                diagnosticMode = "openFilesOnly",
                autoSearchPaths = false
              }
            }
          }
        }
      )
    end
  }
)

-----------------------------------------------------
-- nvim-cmp supports additional completion capabilities
-----------------------------------------------------
-- util.default_config =
--   vim.tbl_extend(
--   "force",
--   util.default_config,
--   {
--     autostart = true,
--     capabilities = capabilities
--   }
-- )
