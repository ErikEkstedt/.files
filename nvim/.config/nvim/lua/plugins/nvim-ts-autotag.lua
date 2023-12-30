return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup({autotag = {enable = true}})
    --   {
    --     autotag = {enable = true},
    --     filetypes = {
    --       "html",
    --       "htmldjango",
    --       "javascript",
    --       "javascriptreact",
    --       "jsx",
    --       "typescript",
    --       "typescriptreact",
    --       "tsx",
    --       "rescript",
    --       "svelte",
    --       "vue",
    --       "xml",
    --       "php",
    --       "markdown",
    --       "glimmer",
    --       "handlebars",
    --       "hbs"
    --     }
    --   }
    -- )
  end
}
