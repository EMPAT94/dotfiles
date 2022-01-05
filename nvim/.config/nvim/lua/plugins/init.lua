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
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {
        border = "rounded",
      }
    end,
  },
}

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [=[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]=]

packer.startup(function(use)

  -- Have package manager manage package manager
  use "wbthomason/packer.nvim"

  -- Library of lua functions.
  use "nvim-lua/plenary.nvim"

  -- An implementation of the Popup API from vim in Neovim.
  use "nvim-lua/popup.nvim"

  -- Collection of common configurations for Neovim's built-in language server client.
  use { "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" }

  -- A highly extendable fuzzy finder over lists.
  use "nvim-telescope/telescope.nvim"

  -- fzf-native is a c port of fzf
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  -- Wraps the Neovim treesitter API to provide functionalities
  -- such as highlighting and incremental selection,
  -- and a command to easily install parsers.
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- A completion engine plugin for neovim written in Lua.
  use "hrsh7th/nvim-cmp"

  -- Completion Sources
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "ray-x/cmp-treesitter"
  use "quangnguyen30192/cmp-nvim-ultisnips"

  -- A file system explorer for the Vim editor.
  use "preservim/nerdtree"

  -- A dark theme
  use "dracula/vim"

  -- Provides mappings to easily delete, change and add such surroundings in pairs.
  use "tpope/vim-surround"

  -- Vim sugar for the UNIX shell commands
  use "tpope/vim-eunuch"

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Provides a single command that deletes the current buffer in a smart way.
  use {
    "mhinz/vim-sayonara",
    cmd = "Sayonara",
  }

  -- Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?
  use "tpope/vim-fugitive"

  -- A minimalist autopairs for Neovim written by Lua.
  use "windwp/nvim-autopairs"

  -- Git signs written in pure lua.
  use "lewis6991/gitsigns.nvim"

  -- Color highlighter for Neovim
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "html" })
    end,
  }

  --  Preview Markdown in real-time with a web browser.
  use {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
  }

  -- Distraction-free writing in Vim.
  use {
    "junegunn/goyo.vim",
    cmd = "Goyo",
  }

  -- UltiSnips is the ultimate solution for snippets in Vim.
  use "SirVer/ultisnips"

  -- A (Neo)vim plugin for formatting code.
  use "sbdchd/neoformat"

  -- A simple rss reader plugin for neovim
  -- use "empat94/nvim-rss"

  -- Adds file type icons to Vim plugins
  use "ryanoasis/vim-devicons"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

require "plugins.telescope"

require "plugins.treesitter"

require "plugins.lsp-installer"

require "plugins.cmp"

require "plugins.nerdtree"

require "plugins.gitsigns"

require "plugins.nvim-autopairs"

require "plugins.nvim-rss"

require "plugins.goyo"

require "plugins.neoformat"

require "plugins.ultisnips"

-- Language Servers https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
-- yay -S typescript typescript-language-server
-- yay -S bash-language-server
-- yay -S vscode-langservers-extracted
-- yay -S vim-language-server
-- yay -S lua-language-server
-- yay -S haskell-language-server _disabled in current config_
--
-- Providers, Formatters, Linters
-- npm i -g neovim
-- npm i -g prettier
-- pip install pynvim
-- luarocks install --server=https://luarocks.org/dev luaformatter
