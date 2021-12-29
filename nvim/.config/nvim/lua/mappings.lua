local o = {
  noremap = true,
  silent = false,
}

local s = {
  noremap = true,
  silent = true,
}

local k = vim.api.nvim_set_keymap

-- Remap space as leader key and comma as localleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Quick Escape
k("i", "jk", "<Esc>", s)

-- Remap j and k to scroll by visual lines
k("n", "j", "gj", s)
k("n", "k", "gk", s)
k("n", "j", "gj", s)
k("n", "k", "gk", s)

-- Colon switch
k("n", ";", ":", o)
k("v", ";", ":", o)

-- Config change
k("n", "<leader>e", ":vsp ~/.config/nvim/lua<CR>", s)

-- Save and quit
k("n", "<leader>u", ":update<CR>", s)
k("n", "<leader>q", ":Sayonara<CR>", s)

-- Next & prev buffer
k("n", "gb", ":bprevious<CR>", s)
k("n", "gB", ":bnext<CR>", s)

-- Split window jumps
k("", "<M-h>", "<C-w>h", s)
k("", "<M-j>", "<C-w>j", s)
k("", "<M-k>", "<C-w>k", s)
k("", "<M-l>", "<C-w>l", s)
k("", "<M-h>", [[<C-\><C-n><C-w>h]], s)
k("", "<M-j>", [[<C-\><C-n><C-w>j]], s)
k("", "<M-k>", [[<C-\><C-n><C-w>k]], s)
k("", "<M-l>", [[<C-\><C-n><C-w>l]], s)

-- Quick vertical & horizontal split
k("n", "<leader>vn", ":vsplit<CR>", s)
k("n", "<leader>vt", [[:vsplit | terminal <CR>]], s)
k("n", "<leader>vh", ":vertical help ", o)
k("n", "<leader>vj", [[:vsplit | terminal ]], o)
k("n", "<leader>xn", ":split<CR>", s)
k("n", "<leader>xt", [[:split | terminal <CR>]], s)

-- Quick tabs
k("n", "<leader>tn", ":tabnew <CR>", s)
k("n", "<leader>tt", [[:tabnew | terminal <CR>]], o)
k("n", "<leader>th", ":tab help ", o)
k("n", "<leader>tj", [[:tabnew | terminal ]], s)

-- Yank till end of line
k("n", "Y", "yg_", s)

-- Indents
k("n", "<", "<<", s)
k("n", ">", ">>", s)

-- Blank lines
k("n", "<leader>j", "o<ESC>k", s)
k("n", "<leader>k", "O<ESC>j", s)

-- Very Magic search
k("n", "/", [[/\v]], o)

-- Search and replace
k("n", "<leader>r", ":%s//g<Left><Left>", o)
k("v", "<leader>r", ":s//g<Left><Left>", o)

-- Clear search highlights
k("n", "<leader><CR>", ":nohls<CR>", s)

-- Inbuild terminal ESC normal mode
k("t", "<Esc>", [[<C-\><C-n>]], s)

-- Sigh... Things were not supposed to break like this
-- Open url under cursor into browser
k("n", "gx", "yiW:!xdg-open <cWORD><CR> <C-r>-- & <CR><CR>", o)
