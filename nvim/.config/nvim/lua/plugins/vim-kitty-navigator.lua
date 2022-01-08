vim.g.kitty_navigator_no_mappings = 1

vim.api.nvim_set_keymap("n", "<M-h>", ":KittyNavigateLeft<CR>", {
  noremap = true,
  silent = true,
})

vim.api.nvim_set_keymap("n", "<M-j>", ":KittyNavigateDown<CR>", {
  noremap = true,
  silent = true,
})

vim.api.nvim_set_keymap("n", "<M-k>", ":KittyNavigateUp<CR>", {
  noremap = true,
  silent = true,
})

vim.api.nvim_set_keymap("n", "<M-l>", ":KittyNavigateRight<CR>", {
  noremap = true,
  silent = true,
})
