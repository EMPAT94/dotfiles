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

	mappings = {
		finder = {
			["<cr>"] = "Select",
			["<c-c>"] = "NOP",
			["<esc>"] = "Close",
			["<c-n>"] = "Next",
			["<c-p>"] = "Previous",
			["<down>"] = "NOP",
			["<up>"] = "NOP",
			["<tab>"] = "MultiselectToggleNext",
			["<s-tab>"] = "MultiselectTogglePrevious",
			["<c-j>"] = "NOP",
		},
		-- Setting any of these to `false` will disable the mapping.
		status = {
			["q"] = "Close",
			["I"] = false,
			["1"] = false,
			["2"] = false,
			["3"] = false,
			["4"] = false,
			["<tab>"] = "Toggle",
			["x"] = "Discard",
			["s"] = "Stage",
			["S"] = "StageAll",
			["<c-s>"] = false,
			["u"] = "Unstage",
			["U"] = "UnstageStaged",
			["d"] = "DiffAtFile",
			["$"] = "CommandHistory",
			["#"] = "Console",
			["<c-r>"] = "RefreshBuffer",
			["<enter>"] = "GoToFile",
			["<c-v>"] = "VSplitOpen",
			["<c-x>"] = "SplitOpen",
			["<c-t>"] = "TabOpen",
			["?"] = "HelpPopup",
			["D"] = false,
			["p"] = "PullPopup",
			["r"] = "RebasePopup",
			["m"] = "MergePopup",
			["P"] = "PushPopup",
			["c"] = "CommitPopup",
			["l"] = "LogPopup",
			["v"] = "RevertPopup",
			["Z"] = "StashPopup",
			["A"] = "CherryPickPopup",
			["b"] = "BranchPopup",
			["f"] = false,
			["X"] = "ResetPopup",
			["M"] = false,
			["{"] = "GoToPreviousHunkHeader",
			["}"] = "GoToNextHunkHeader",
		},
	},
})
