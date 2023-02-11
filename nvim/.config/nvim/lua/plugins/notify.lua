-- Notify: https://github.com/rcarriga/nvim-notify
return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup(
      {
        -- Animation style (see below for details)
        stages = "fade_in_slide_out",
        -- Function called when a new window is opened, use for changing win settings/config
        on_open = nil,
        -- Render function for notifications. See notify-render()
        render = "default",
        -- Default timeout for notifications
        timeout = 5000,
        -- For stages that change opacity this is treated as the highlight behind the window
        -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
        background_colour = "Normal",
        -- Minimum width for notification windows
        minimum_width = 50,
        -- Icons for the different levels
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎"
        }
      }
    )

    -- Highlight
    -- DEBUG
    vim.cmd("hi NotifyDEBUGBorder guifg=#F70067")
    vim.cmd("hi NotifyDEBUGIcon guifg=#F70067")
    vim.cmd("hi NotifyDEBUGTitle  guifg=#F70067")
    -- INFO
    vim.cmd("hi NotifyINFOBorder guifg=#A9FF68")
    vim.cmd("hi NotifyINFOIcon guifg=#A9FF68")
    vim.cmd("hi NotifyINFOTitle guifg=#A9FF68")
  end
}
