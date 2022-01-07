require("zen-mode").setup {
  options = {
    signcolumn = "no", -- disable signcolumn
    number = false, -- disable number column
    relativenumber = false, -- disable relative numbers
  },
  kitty = {
    enabled = false,
    font = "+2", -- font size increment
  },
}

vim.api.nvim_set_keymap("n", "<leader>g", ":ZenMode<CR>", {
  noremap = true,
  silent = true,
})
