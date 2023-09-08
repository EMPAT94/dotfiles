local neogit = require("neogit")

neogit.setup({
	-- Hides the hints at the top of the status buffer
	disable_hint = true,
	-- Disables changing the buffer highlights based on where the cursor is.
	disable_context_highlighting = true,
	-- Open in a split window below
	kind = "split",
	status = {
		recent_commit_count = 5,
	},
	-- Disables signs for sections/items/hunks
	disable_signs = false,
})
