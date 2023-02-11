return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup(
      {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        mode = "background", -- Set the display mode.
        tailwind = true -- Enable tailwind colors
      }
    )
  end
}
