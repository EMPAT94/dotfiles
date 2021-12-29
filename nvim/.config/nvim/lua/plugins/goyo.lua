vim.g.goyo_width = 100
vim.g.goyo_height = 100

vim.api.nvim_set_keymap("n", "<leader>g", ":Goyo<CR>", {
  noremap = true,
  silent = true,
})
