-- Do :TSUpdate on change
require"nvim-treesitter.configs".setup {
  ensure_installed = {
    "python",
    "comment",
    "lua",
    "json",
    "typescript",
    "cpp",
    "vue",
    "make",
    "css",
    "regex",
    "http",
    "c",
    "java",
    "jsonc",
    "hjson",
    "json5",
    "bash",
    "cmake",
    "yaml",
    "jsdoc",
    "tsx",
    "toml",
    "javascript",
    "kotlin",
    "dockerfile",
    "html",
    "scss",
    "haskell",
    "elixir",
    "eex",
    "heex",
    -- "vim", -- Causes highlighting errors in vim.cmd [[]]
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
