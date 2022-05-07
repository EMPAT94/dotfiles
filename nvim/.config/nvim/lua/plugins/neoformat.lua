vim.api.nvim_set_keymap("n", "<leader>p", ":Neoformat<CR>", { noremap = true, silent = false })

vim.cmd [[

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Only msg when there is an error"
let g:neoformat_only_msg_on_error = 1

]]
