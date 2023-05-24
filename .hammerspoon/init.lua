meh = {"alt","shift"}
hyper = {"alt","shift","ctrl"}

logger = hs.logger.new('bryalee', 'debug')

hs.grid.setGrid("6x2")
hs.grid.HINTS = {
    {'1', '2', '3', '4', '5', '6'},
    {'1', '2', '3', '4', '5', '6'},
    {'W', 'F', 'P', 'L', 'U', 'Y'},
    {'R', 'S', 'T', 'N', 'E', 'I'}
}
hs.grid.setMargins("0x0")
hs.window.animationDuration = 0

hs.hotkey.bind(hyper, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")

hs.loadSpoon("AppWindowSwitcher")
    :bindHotkeys({
        ["iTerm2"]  = {meh, "t"},
        ["Outlook"] = {meh, "e"},
        ["Slack"] = {meh, "c"},
        ["Microsoft Edge"] = {meh, "b"},
        ["Microsoft Teams"] = {meh, "v"},
        ["Logseq"] = {meh, "q"},
        ["Spotify"] = {meh, "m"}
    })

hs.hotkey.bind(hyper, "n", function()
    currentWindow = hs.window.focusedWindow()
    currentScreen = currentWindow:screen()

    currentWindow:moveToScreen(currentScreen:next())
    hs.grid.maximizeWindow(currentWindow)
end)

hs.hotkey.bind(meh, "n", function()
    currentWindow = hs.window.focusedWindow()
    currentScreen = currentWindow:screen()
    nextScreen = currentScreen:next()
    windows = hs.window.filter.new():setScreens(nextScreen:id()):getWindows()
    windows[1]:focus()
-- hs.hotkey.bind(meh, "j", function()
--     windows = hs.window.filter.defaultCurrentSpace:getWindows()
--     for k,v in pairs(windows) do
--         logger.i(k, v)
--     end
end)

hs.hotkey.bind(meh, "g", function()
    hs.grid.toggleShow()
end)

hs.hotkey.bind(meh, "=", function()
    hs.grid.maximizeWindow(hs.window.focusedWindow())
end)

-- todo
-- focus window on next screen
-- center cursor on window
-- move window to another space (not screen)
-- cycle focus through windows
