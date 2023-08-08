require("gitsigns").setup({
	signs = {
		add = {
			hl = "DraculaGreen",
			text = "▐",
		},
		change = {
			hl = "DraculaYellow",
			text = "▐",
		},
		delete = {
			hl = "DraculaRed",
			text = "▬",
		},
		topdelete = {
			hl = "DraculaRed",
			text = "▬",
		},
		changedelete = {
			hl = "DraculaOrange",
			text = "▐",
		},
		untracked = {
			hl = "DraculaGreen",
			text = "▐",
		},
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "<leader>hs", gs.stage_hunk)
		map("n", "<leader>hr", gs.reset_hunk)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hp", gs.preview_hunk)
	end,
})
