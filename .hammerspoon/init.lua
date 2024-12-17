local meh = { "alt", "shift" }
local hyper = { "alt", "shift", "ctrl" }

logger = hs.logger.new("bryalee", "debug")

hs.grid.setGrid("6x4")
hs.grid.HINTS = {
	{ "1", "2", "3", "4", "5", "6" },
	{ "1", "2", "3", "4", "5", "6" },
	{ "Q", "W", "E", "R", "T", "Y" },
	{ "A", "S", "D", "F", "G", "H" },
	{ "Z", "X", "C", "V", "B", "N" },
}
hs.grid.setMargins("0x0")
hs.window.animationDuration = 0

hs.alert.show("Hammerspoon config loaded")
hs.hotkey.bind(hyper, "r", function()
	hs.reload()
end)
hs.keycodes.inputSourceChanged(function()
	hs.reload()
end)

hs.loadSpoon("AppWindowSwitcher"):bindHotkeys({
	[{ "iTerm2", "WezTerm" }] = { meh, "t" },
	[{ "Code", "IntelliJ IDEA" }] = { meh, "i" },
	[{ "Outlook", "Microsoft Outlook" }] = { meh, "e" },
	["Slack"] = { meh, "c" },
	[{ "Microsoft Edge", "Google Chrome", "Arc", "Vivaldi" }] = { meh, "b" },
	["Microsoft Teams"] = { meh, "v" },
	["Logseq"] = { meh, "q" },
	["Spotify"] = { meh, "m" },
})
hs.loadSpoon("MouseFollowsFocus"):start()

hs.hotkey.bind(hyper, "n", function()
	local currentWindow = hs.window.focusedWindow()
	local currentScreen = currentWindow:screen()

	currentWindow:moveToScreen(currentScreen:next())
	hs.grid.maximizeWindow(currentWindow)
end)

hs.hotkey.bind(meh, "n", function()
	local currentWindow = hs.window.focusedWindow()
	local currentScreen = currentWindow:screen()
	local nextScreen = currentScreen:next()
	local windows = hs.window.filter.new():setScreens(nextScreen:id()):getWindows()

	windows[1]:focus()
end)

hs.hotkey.bind({ "alt" }, "h", function()
	hs.window.focusedWindow():focusWindowWest(nil, true)
end)
hs.hotkey.bind({ "alt" }, "l", function()
	hs.window.focusedWindow():focusWindowEast(nil, true)
end)
hs.hotkey.bind({ "alt" }, "j", function()
	hs.window.focusedWindow():focusWindowSouth(nil, true)
end)
hs.hotkey.bind({ "alt" }, "k", function()
	hs.window.focusedWindow():focusWindowNorth(nil, true)
end)

local function getNextWidth(width, screenWidth, sizes)
	for i, val in ipairs(sizes) do
		if width == math.floor(screenWidth * val) then
			return math.floor(sizes[(i % #sizes) + 1] * screenWidth)
		end
	end

	return math.floor(sizes[1] * screenWidth)
end

hs.hotkey.bind(meh, "h", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local width = getNextWidth(f.w, max.w, { 2 / 3, 1 / 2, 1 / 3 })

	f.x = max.x
	f.y = max.y
	f.w = width
	f.h = max.h
	win:setFrame(f)
end)
hs.hotkey.bind(meh, "l", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local width = getNextWidth(f.w, max.w, { 1 / 3, 1 / 2, 2 / 3 })

	f.x = max.x + (max.w - width)
	f.y = max.y
	f.w = width
	f.h = max.h
	win:setFrame(f)
end)

hs.hotkey.bind(meh, "g", function()
	hs.grid.toggleShow()
end)

hs.hotkey.bind(meh, "=", function()
	hs.grid.maximizeWindow(hs.window.focusedWindow())
end)

local spaces = require("hs.spaces")
function MoveWindowToSpace(sp)
	local spaceId = spaces.spacesForScreen()[sp]
	spaces.moveWindowToSpace(hs.window.focusedWindow():id(), spaceId)
	spaces.gotoSpace(spaceId)
	hs.eventtap.keyStroke({}, "esc")
end

hs.hotkey.bind(hyper, "1", function()
	MoveWindowToSpace(1)
end)
hs.hotkey.bind(hyper, "2", function()
	MoveWindowToSpace(2)
end)
hs.hotkey.bind(hyper, "3", function()
	MoveWindowToSpace(3)
end)
hs.hotkey.bind(hyper, "4", function()
	MoveWindowToSpace(4)
end)

hs.hotkey.bind(hyper, "u", function()
	hs.eventtap.keyStrokes("thisisunsafe")
end)

hs.hints.style = "vimperator"
hs.hints.fontSize = "10.0"
hs.hints.showTitleThresh = 0
hs.hotkey.bind(meh, "f", function()
	hs.hints.windowHints()
end)
-- hs.hotkey.bind('alt', 'a', function()
--     hs.window.switcher.previousWindow()
-- end)

-- todo
-- focus window on next screen
-- center cursor on window
-- move window to another space (not screen)
-- cycle focus through windows
