local ls = require("luasnip")
local cmp = require "cmp"

vim.o.completeopt = "menu,menuone,noselect"

local cmp_theme = "left" -- 'left', 'vscode'

local mapping = {
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-e>"] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping(
    {
      i = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ select = false })
    }
  ),
  ["<localleader><localleader>"] = cmp.mapping(
    {
      i = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ select = false })
    }
  ),
  ["<C-n>"] = cmp.mapping(
    function(fallback)
      if ls.expand_or_locally_jumpable() then
        ls.expand_or_jump()
      else
        fallback() -- The fallback function sends
      end
    end,
    { "i", "s" }
  ),
  ["<C-p>"] = cmp.mapping(
    function(fallback)
      if ls.expand_or_locally_jumpable() then
        ls.jump(-1)
      else
        fallback() -- The fallback function sends
      end
    end,
    { "i", "s" }
  ),
  ["<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end,
  ["<S-Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end
}

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local kind_icons_vscode = {
  Text = "  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  "
}

local fmt = {
  fields = { "abbr", "kind", "menu" },
  format = function(entry, vim_item)
    -- Kind icons
    vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
    -- Source
    vim_item.menu =
    ({
      path = "ﱮ", -- [path]
      luasnip = "", -- "[snip]",
      nvim_lsp = "ﲳ",
      nvim_lua = "", -- "[api]",
      buffer = "﬘", -- buffer = "[buf]"
      treesitter = "",
      spell = "暈",
      latex_symbols = "[LaTeX]"
    })[entry.source.name]
    return vim_item
  end
}

local fmt_vscode = {
  fields = { "abbr", "kind", "menu" },
  format = function(_, vim_item)
    vim_item.kind = (kind_icons_vscode[vim_item.kind] or "") .. vim_item.kind
    return vim_item
  end
}

local fmt_left = {
  fields = { "kind", "abbr", "menu" },
  format = function(entry, vim_item)
    local item =
    require("lspkind").cmp_format(
      {
        mode = "symbol_text",
        menu = ({
          path = "ﱮ", -- [path]
          buffer = "[BUF]",
          nvim_lsp = "[LSP]",
          luasnip = "[Snip]",
          nvim_lua = "[LUA]",
          latex_symbols = "[Latex]"
        }),
        maxwidth = 50,
        before = require("tailwindcss-colorizer-cmp").formatter
      }
    )(entry, vim_item)
    local strings = vim.split(item.kind, "%s", { trimempty = true })
    item.kind = " " .. strings[1] .. " "
    if #strings > 1 then
      item.menu = item.menu .. " (" .. strings[2] .. ")"
    end
    return item
  end
}

-- Highlight
vim.cmd("hi DocumentNC guifg=#F70067")
local highlights = {
  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
  -- CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },
  -- CmpItemMenu = { fg = "#F5EBD9", bg = "NONE" },
  CmpItemMenu = { fg = "#7E8294", bg = "NONE" },
  CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" }
}

local highlights_vscode = {
  CmpItemAbbrDeprecated = { bg = "NONE", fg = "#808080", fmt = "strikethrough" },
  CmpItemAbbrMatch = { bg = "NONE", fg = "#569CD6" },
  CmpItemAbbrMatchFuzzy = { bg = "NONE", fg = "#569CD6" },
  CmpItemKindVariable = { bg = "NONE", fg = "#9CDCFE" },
  CmpItemKindInterface = { bg = "NONE", fg = "#9CDCFE" },
  CmpItemKindText = { bg = "NONE", fg = "#9CDCFE" },
  CmpItemKindFunction = { bg = "NONE", fg = "#C586C0" },
  CmpItemKindMethod = { bg = "NONE", fg = "#C586C0" },
  CmpItemKindKeyword = { bg = "NONE", fg = "#D4D4D4" },
  CmpItemKindProperty = { bg = "NONE", fg = "#D4D4D4" },
  CmpItemKindUnit = { bg = "NONE", fg = "#D4D4D4" }
}

-- THEME settings
local col_offset = 0
local side_padding = 1
if cmp_theme == "vscode" then
  highlights = highlights_vscode
  fmt = fmt_vscode
elseif cmp_theme == "left" then
  fmt = fmt_left
  -- fmt = {
  --   format = require("lspkind").cmp_format(
  --     {
  --       mode = "symbol_text",
  --       menu = ({
  --         buffer = "[BUF]",
  --         nvim_lsp = "[LSP]",
  --         luasnip = "[Snip]",
  --         nvim_lua = "[LUA]",
  --         latex_symbols = "[Latex]"
  --       })
  --     }
  --   )
  -- }
  col_offset = -3
  side_padding = 0
end

for type, color in pairs(highlights) do
  local hi = string.format("highlight! %s guibg=%s guifg=%s", type, color.bg, color.fg)
  if color.fmt then
    hi = hi .. " gui=" .. color.fmt
  end
  vim.cmd(hi)
end

cmp.setup(
  {
    completion = { keyword_length = 2 },
    snippet = {
      expand = function(args)
        ls.lsp_expand(args.body)
      end
    },
    mapping = mapping,
    sources = {
      { name = "buffer", max_item_count = 2 },
      { name = "luasnip", priority = 10 },
      { name = "nvim_lsp", priority = 10, max_item_count = 50 },
      { name = "nvim_lua", max_item_count = 5 },
      { name = "path", max_item_count = 5 }
    },
    formatting = fmt,
    performance = { debounce = 200, throttle = 50, fetching_timeout = 100 },
    experimental = {
      native_menu = false,
      ghost_text = true
    },
    window = {
      completion = {
        col_offset = col_offset,
        side_padding = side_padding
      },
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = "FloatBorder:DocumentNC,Normal:Normal"
      }
    }
  }
)
