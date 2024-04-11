local f = require("./functions")

local mappings = {
	{ modifiers = { "cmd" }, key = "b", fn = f.openBrowser },
	{ modifiers = { "cmd" }, key = "return", fn = f.openTerminal },

	{ modifiers = { "alt" }, key = "m", fn = f.zoom },
	{ modifiers = { "alt" }, key = "h", fn = f.slideLeft },
	{ modifiers = { "alt" }, key = "j", fn = f.slideBottom },
	{ modifiers = { "alt" }, key = "k", fn = f.slideTop },
	{ modifiers = { "alt" }, key = "l", fn = f.slideRight },

	-- { modifiers = { "alt" }, key = "1", fn = f.goToSpace1 },
	-- { modifiers = { "alt" }, key = "2", fn = f.goToSpace2 },
	-- { modifiers = { "alt" }, key = "3", fn = f.goToSpace3 },
	-- { modifiers = { "alt" }, key = "4", fn = f.goToSpace4 },
	-- { modifiers = { "alt" }, key = "5", fn = f.goToSpace5 },

	{ modifiers = { "alt", "shift" }, key = "1", fn = f.moveWinToSpace1 },
	{ modifiers = { "alt", "shift" }, key = "2", fn = f.moveWinToSpace2 },
	{ modifiers = { "alt", "shift" }, key = "3", fn = f.moveWinToSpace3 },
	{ modifiers = { "alt", "shift" }, key = "4", fn = f.moveWinToSpace4 },
	{ modifiers = { "alt", "shift" }, key = "5", fn = f.moveWinToSpace5 },
}

f.mapKeys(mappings)

hs.loadSpoon("Shade")

-----------------
-- Break Timer --
-----------------

local breakTimer = hs.timer.doEvery(60 * 50, function()
	hs.alert.show("Take a break!")
	hs.timer.doAfter(5, function()
		hs.caffeinate.lockScreen()
	end)
end)

hs.hotkey.bind({ "alt" }, "t", function()
	if breakTimer:running() then
		hs.alert.show("Breaktimer stopped!")
		breakTimer:stop()
	else
		hs.alert.show("Breaktimer started!")
		breakTimer:start()
	end
end)

------------------
-- Quick reload --
------------------

-- hs.hotkey.bind({ "alt" }, "r", function()
-- 	hs.reload()
-- end)
