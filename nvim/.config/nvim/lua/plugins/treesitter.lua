-- Do :TSUpdate on change
require"nvim-treesitter.configs".setup {
  ensure_installed = {
    "bash",
    "clojure",
    "css",
    "dockerfile",
    "eex",
    "elixir",
    "heex",
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
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
