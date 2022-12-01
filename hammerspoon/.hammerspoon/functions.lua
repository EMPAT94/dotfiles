local M = {}

function M.zoom()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h
	win:setFrame(f)
end

function M.slideLeft()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end

function M.slideBottom()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.y = max.y + max.h / 2
	f.h = max.h / 2
	win:setFrame(f)
end

function M.slideTop()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.y = max.y
	f.h = max.h / 2
	win:setFrame(f)
end

function M.slideRight()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + max.w / 2
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end

local function _openApp(name); hs.application.launchOrFocus(name); end

function M.openBrowser(); _openApp("firefox"); end
function M.openTerminal(); _openApp("kitty"); end
function M.openMusic(); _openApp("vlc"); end
function M.openEditor(); _openApp("kitty nvim"); end

function M.mapKeys(mappings)
	for i in pairs(mappings) do
		local modifiers = mappings[i]["modifiers"]
		local key = mappings[i]["key"]
		local fn = mappings[i]["fn"]
		hs.hotkey.bind(modifiers, key, fn)
	end
end

return M
