-- Do :TSUpdate on change
require"nvim-treesitter.configs".setup {
  ensure_installed = {
    "bash",
    "c",
    "clojure",
    "cmake",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "eex",
    "elixir",
    "haskell",
    "heex",
    "hjson",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "kotlin",
    "lua",
    "make",
    "python",
    "regex",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vue",
    "yaml",
    -- "vim", -- Causes highlighting errors in vim.cmd [[]]
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
