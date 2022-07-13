require"nvim-tree".setup({ disable_netrw = true }) -- False when sshing 

vim.api.nvim_set_keymap("n", "<leader>z", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

