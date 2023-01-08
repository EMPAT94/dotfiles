local f = require("./functions")

local mappings = {
	{ modifiers = { "cmd" }, key = "b", fn = f.openBrowser },
	{ modifiers = { "cmd" }, key = "return", fn = f.openTerminal },

	{ modifiers = { "alt" }, key = "m", fn = f.zoom },
	{ modifiers = { "alt" }, key = "h", fn = f.slideLeft },
	{ modifiers = { "alt" }, key = "j", fn = f.slideBottom },
	{ modifiers = { "alt" }, key = "k", fn = f.slideTop },
	{ modifiers = { "alt" }, key = "l", fn = f.slideRight },

	{ modifiers = { "alt", "shift" }, key = "1", fn = f.moveWinToSpace1 },
	{ modifiers = { "alt", "shift" }, key = "2", fn = f.moveWinToSpace2 },
	{ modifiers = { "alt", "shift" }, key = "3", fn = f.moveWinToSpace3 },
	{ modifiers = { "alt", "shift" }, key = "4", fn = f.moveWinToSpace4 },
	{ modifiers = { "alt", "shift" }, key = "5", fn = f.moveWinToSpace5 },
}

f.mapKeys(mappings)

hs.loadSpoon("Shade")
hs.loadSpoon("RoundedCorners"):start()

-- hs.hotkey.bind({ "alt" }, "r", function()
-- 	hs.reload()
-- end)
-- hs.alert.show("Config loaded")
