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
	use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })

	-- A highly extendable fuzzy finder over lists.
	use("nvim-telescope/telescope.nvim")

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

	-- Vim sugar for the UNIX shell commands
	use("tpope/vim-eunuch")

	-- Smart and Powerful commenting plugin for neovim
	use("numToStr/Comment.nvim")

	-- A minimalist autopairs for Neovim written by Lua.
	use("windwp/nvim-autopairs")

	-- Git signs written in pure lua.
	use("lewis6991/gitsigns.nvim")

	-- Snippet engine in LUA
	use({ "L3MON4D3/LuaSnip" })

	-- navigate seamlessly between vim and kitty splits
	use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty" })

	-- This (neo)vim plugin makes scrolling nice and smooth.
	use("psliwka/vim-smoothie")

	-- Distraction-free writing for Neovim.
	use("folke/zen-mode.nvim")

	-- A (Neo)vim plugin for formatting code.
	use({ "sbdchd/neoformat", cmd = "Neoformat" })

	-- Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?
	use({ "tpope/vim-fugitive", cmd = "G" })

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

	-- Interactive repl
	use("hkupty/iron.nvim")

	-- Rainbow parentheses for neovim using tree-sitter.
	use("p00f/nvim-ts-rainbow")

	-- Useless QoL plugin
	use("eandrju/cellular-automaton.nvim")

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

require("Comment").setup()

require("plugins.telescope")

require("plugins.treesitter")

require("plugins.lsp-installer")

require("plugins.cmp")

require("plugins.gitsigns")

require("plugins.nvim-autopairs")

require("plugins.neoformat")

require("plugins.nvim-tree")

require("plugins.zen-mode")

require("plugins.iron-nvim")

-- require "plugins.nvim-rss" -- Uncomment when using github uri

-- Tools
-- npm i -g neovim
-- pip install pynvim
