local neogit = require("neogit")

neogit.setup({
	-- Hides the hints at the top of the status buffer
	disable_hint = true,

	-- Disables changing the buffer highlights based on where the cursor is.
	disable_context_highlighting = true,

	-- Open in a split window below
	kind = "split",

	-- Don't show recent commits in status
	status = {
		recent_commit_count = 0,
	},

	-- Disables signs for sections/items/hunks
	disable_signs = true,

	-- mappings = {
	-- 	finder = {
	-- 		["<cr>"] = "Select",
	-- 		["<c-c>"] = "NOP",
	-- 		["<esc>"] = "Close",
	-- 		["<c-n>"] = "Next",
	-- 		["<c-p>"] = "Previous",
	-- 		["<down>"] = "NOP",
	-- 		["<up>"] = "NOP",
	-- 		["<tab>"] = "MultiselectToggleNext",
	-- 		["<s-tab>"] = "MultiselectTogglePrevious",
	-- 		["<c-j>"] = "NOP",
	-- 	},
	-- 	-- Setting any of these to `false` will disable the mapping.
	-- 	popup = {
	-- 		["?"] = "HelpPopup",
	-- 		["A"] = "CherryPickPopup",
	-- 		["D"] = "DiffPopup",
	-- 		["M"] = "RemotePopup",
	-- 		["P"] = "PushPopup",
	-- 		["X"] = "ResetPopup",
	-- 		["Z"] = "StashPopup",
	-- 		["b"] = "BranchPopup",
	-- 		["c"] = "CommitPopup",
	-- 		["f"] = "FetchPopup",
	-- 		["l"] = "LogPopup",
	-- 		["m"] = "MergePopup",
	-- 		["p"] = "PullPopup",
	-- 		["r"] = "RebasePopup",
	-- 		["v"] = "RevertPopup",
	-- 	},
	-- 	status = {
	-- 		["q"] = "Close",
	-- 		["I"] = "InitRepo",
	-- 		["1"] = "Depth1",
	-- 		["2"] = "Depth2",
	-- 		["3"] = "Depth3",
	-- 		["4"] = "Depth4",
	-- 		["<tab>"] = "Toggle",
	-- 		["x"] = "Discard",
	-- 		["s"] = "Stage",
	-- 		["S"] = "StageAll",
	-- 		["u"] = "Unstage",
	-- 		["U"] = "UnstageStaged",
	-- 		["d"] = "DiffAtFile",
	-- 		["$"] = "CommandHistory",
	-- 		["#"] = "Console",
	-- 		["<c-r>"] = "RefreshBuffer",
	-- 		["<enter>"] = "GoToFile",
	-- 		["<c-v>"] = "VSplitOpen",
	-- 		["<c-x>"] = "SplitOpen",
	-- 		["<c-t>"] = "TabOpen",
	-- 		["["] = "GoToPreviousHunkHeader",
	-- 		["]"] = "GoToNextHunkHeader",
	-- 	},
	-- },
})
