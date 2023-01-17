-- config for p00f/nvim-ts-rainbow plugin, is part of treesitter setup
local rainbow_paren_enabled_list = { "clojure", "commonlisp", "racket" }
local rainbow_config = {
	enable = true,
	-- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	extended_mode = true,
	-- Enable only for  languages in above list
	disable = vim.tbl_filter(function(p)
		local disable = true
		for _, lang in pairs(rainbow_paren_enabled_list) do
			if p == lang then
				disable = false
			end
		end
		return disable
	end, require("nvim-treesitter.parsers").available_parsers()),
}

-- Do :TSUpdate on change
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"python",
		"scss",
		"toml",
		"tsx",
		"typescript",
		"vue",
		"yaml",
		"haskell",
		"java",
		"kotlin",
		"swift",
		"clojure",
		"go",
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true, disable = { "python", "yaml" } },
	rainbow = rainbow_config,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
