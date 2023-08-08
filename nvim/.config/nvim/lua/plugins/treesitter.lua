-- Do :TSUpdate on change
require("nvim-treesitter.configs").setup({
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true, disable = { "python", "yaml" } },
	auto_install = true,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
