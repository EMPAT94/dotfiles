-- Automatically Install Packer https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	-- Speed up loading Lua modules in Neovim to improve startup time.
	use("lewis6991/impatient.nvim")

	-- Have package manager manage package manager
	use("wbthomason/packer.nvim")

	-- Library of lua functions.
	use("nvim-lua/plenary.nvim")

	-- An implementation of the Popup API from vim in Neovim.
	use("nvim-lua/popup.nvim")

	-- Collection of common configurations for Neovim's built-in language server client.
	use("neovim/nvim-lspconfig")

	-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
	use("williamboman/mason.nvim")

	-- mason-lspconfig bridges mason.nvim with the lspconfig plugin
	use("williamboman/mason-lspconfig.nvim")

	-- A highly extendable fuzzy finder over lists.
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- fzf-native is a c port of fzf
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Wraps the Neovim treesitter API
	use("nvim-treesitter/nvim-treesitter")

	-- A completion engine plugin for neovim written in Lua.
	use("hrsh7th/nvim-cmp")

	-- Completion Sources
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("ray-x/cmp-treesitter")
	use("saadparwaiz1/cmp_luasnip")

	-- A file system explorer for the Vim editor.
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

	-- A dark theme
	use({ "dracula/vim", as = "dracula" })

	-- Provides mappings to easily delete, change and add such surroundings in pairs.
	use("tpope/vim-surround")

	-- Smart and Powerful commenting plugin for neovim
	use("numToStr/Comment.nvim")

	-- A minimalist autopairs for Neovim written by Lua.
	use("windwp/nvim-autopairs")

	-- Git signs written in pure lua.
	use("lewis6991/gitsigns.nvim")

	-- Snippet engine in LUA
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
	})
	use("rafamadriz/friendly-snippets")

	-- navigate seamlessly between vim and kitty splits
	use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty" })

	-- This (neo)vim plugin makes scrolling nice and smooth.
	use("psliwka/vim-smoothie")

	-- Distraction-free writing for Neovim.
	use("folke/zen-mode.nvim")

	-- A (Neo)vim plugin for formatting code.
	use({ "sbdchd/neoformat", cmd = "Neoformat" })

	-- Provides a single command that deletes the current buffer in a smart way.
	use({ "mhinz/vim-sayonara", cmd = "Sayonara" })

	-- Markdown Preview for neovim
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		cmd = "MarkdownPreview",
	})

	use({ "NeogitOrg/neogit", requires = { "sindrets/diffview.nvim" } })

	-- Interactive repl
	-- use("hkupty/iron.nvim")

	-- A simple rss reader plugin for neovim
	-- use {
	--   -- "empat94/nvim-rss",
	--   "~/Projects/nvim-rss",
	--   requires = { "tami5/sqlite.lua" },
	--   rocks = { "luaexpat" },
	-- }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

require("impatient")

require("mason").setup({})

require("Comment").setup()

require("plugins.telescope")

require("plugins.treesitter")

require("plugins.mason-config")

require("plugins.cmp")

require("plugins.gitsigns")

require("plugins.nvim-autopairs")

require("plugins.neoformat")

require("plugins.nvim-tree")

require("plugins.zen-mode")

require("plugins.neogit")

require("luasnip.loaders.from_vscode").lazy_load()

-- require "plugins.nvim-rss" -- Uncomment when using github uri

-- Tools
-- npm i -g neovim
-- pip install pynvim
