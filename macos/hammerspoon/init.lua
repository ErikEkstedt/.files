-- Hammerspoon

-- TODO: understand spoons "getting started" 
-- 
-- hs.loadSpoon("ReloadConfiguration")
-- spoon.ReloadConfiguration:start()  -- wathcing conf file?

-------------------------------------------------------------------
-- Globals
-------------------------------------------------------------------
hs.window.animationDuration = 0

cmdAlt = { "cmd", "alt" }
cmdCtrl = { "cmd", "ctrl" }
ctrlAlt = { "ctrl", "alt" }
altShift = { "alt", "shift" }
cmdCtrlShift = { "cmd", "ctrl", "shift" }

-------------------------------------------------------------------
-- Applications
-------------------------------------------------------------------

hs.hotkey.bind("alt", "return", function()
  hs.application.launchOrFocus("Iterm")
end)

hs.hotkey.bind("cmd", "space", function()
  hs.application.launchOrFocus("Mission Control")
end)

hs.hotkey.bind(ctrlAlt, "space", function()
  hs.application.launchOrFocus("Finder")
end)

hs.hotkey.bind('alt', "g", function()
  hs.application.launchOrFocus("Brave browser")
end)

-- hs.hotkey.bind("alt", "return", function()
--   hs.application.open('Alacritty')
-- end)
-- hs.hotkey.bind(ctrlAlt, "space", function()
--   hs.application.open('Finder')
-- end)

-------------------------------------------------------------------
-- Windows
-------------------------------------------------------------------

-- Grid setup
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 100
hs.grid.GRIDHEIGHT = 100

-- a helper function that returns another function that resizes the current window
-- to a certain grid size.
local gridset = function(x, y, w, h)
    return function()
        local win = hs.window.focusedWindow()
        hs.grid.set(
            win,
            {x=x, y=y, w=w, h=h},
            win:screen()
        )
    end
end


-- Window hints
-- hs.hotkey.bind("ctrl", "space", hs.hints.windowHints)

-- Maximize window
hs.hotkey.bind("alt", "F", function()
  hs.grid.maximizeWindow(hs.window.focusedWindow())
end)
hs.hotkey.bind("cmd", "F", function()
  hs.grid.maximizeWindow(hs.window.focusedWindow())
end)

hs.hotkey.bind('alt', 'c', function() 
  hs.window.focusedWindow():centerOnScreen() 
end)

-- Left/Right/Bottom/Top 1/2 of the screen
hs.hotkey.bind(cmdAlt, "h", gridset(0, 0, hs.grid.GRIDWIDTH/2, hs.grid.GRIDHEIGHT))
hs.hotkey.bind(cmdAlt, "l", gridset(hs.grid.GRIDWIDTH/2, 0, hs.grid.GRIDWIDTH/2, hs.grid.GRIDHEIGHT))
hs.hotkey.bind(cmdAlt, "j", gridset(0, hs.grid.GRIDHEIGHT/2, hs.grid.GRIDWIDTH, hs.grid.GRIDHEIGHT/2))
hs.hotkey.bind(cmdAlt, "k", gridset(0, 0, hs.grid.GRIDWIDTH, hs.grid.GRIDHEIGHT/2))

hs.hotkey.bind(cmdAlt, "p", gridset(hs.grid.GRIDWIDTH/2, 0, hs.grid.GRIDWIDTH/2, hs.grid.GRIDHEIGHT/2))
hs.hotkey.bind(cmdAlt, "y", gridset(0, 0, hs.grid.GRIDWIDTH/2, hs.grid.GRIDHEIGHT/2))
hs.hotkey.bind(cmdAlt, ".", gridset(hs.grid.GRIDWIDTH/2, hs.grid.GRIDWIDTH/2, hs.grid.GRIDWIDTH/2, hs.grid.GRIDHEIGHT/2))
hs.hotkey.bind(cmdAlt, "n", gridset(0, hs.grid.GRIDWIDTH/2, hs.grid.GRIDWIDTH/2, hs.grid.GRIDHEIGHT/2))

-- change focus
hs.hotkey.bind(altShift, 'h', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(altShift, 'l', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(altShift, 'k', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(altShift, 'j', function() hs.window.focusedWindow():focusWindowSouth() end)

-- Shift  window on grid
hs.hotkey.bind(ctrlAlt, "h", function()
    hs.grid.pushWindowLeft(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrlAlt, "l", function()
    hs.grid.pushWindowRight(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrlAlt, "k", function()
    hs.grid.pushWindowUp(hs.window.focusedWindow())
end)
hs.hotkey.bind(ctrlAlt, "j", function()
    hs.grid.pushWindowDown(hs.window.focusedWindow())
end)

-- Resize window on grid.
hs.hotkey.bind(cmdCtrlShift, "H", function()
    hs.grid.resizeWindowThinner(hs.window.focusedWindow())
end)
hs.hotkey.bind(cmdCtrlShift, "K", function()
    hs.grid.resizeWindowShorter(hs.window.focusedWindow())
end)
hs.hotkey.bind(cmdCtrlShift, "J", function()
    hs.grid.resizeWindowTaller(hs.window.focusedWindow())
end)
hs.hotkey.bind(cmdCtrlShift, "L", function()
    hs.grid.resizeWindowWider(hs.window.focusedWindow())
end)

-------------------------------------------------------------------
hs.alert.show("Hammerspoon loaded")
