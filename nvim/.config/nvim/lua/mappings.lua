local o = {
  noremap = true,
  silent = false,
}

local s = {
  noremap = true,
  silent = true,
}

local map = vim.api.nvim_set_keymap

-- Remap space as leader key and comma as localleader
map("n", "<SPACE>", "<NOP>", s)
map("n", ",", "<NOP>", s)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Quick Escape
map("i", "jk", "<Esc>", s)

-- Remap j and k to scroll by visual lines
map("n", "j", "gj", s)
map("n", "k", "gk", s)
map("n", "j", "gj", s)
map("n", "k", "gk", s)

-- Colon switch
map("n", ";", ":", o)
map("v", ";", ":", o)

-- Config change
map("n", "<leader>e", ":vsp ~/.config/nvim/lua<CR>", s)

-- Save and quit
map("n", "<leader>s", ":update<CR>", s)
map("n", "<leader>q", ":Sayonara!<CR>", s) -- Keep window
map("n", "Q", ":Sayonara<CR>", s) -- Close window

-- Split window jumps
map("", "<M-h>", "<C-w>h", s)
map("", "<M-j>", "<C-w>j", s)
map("", "<M-k>", "<C-w>k", s)
map("", "<M-l>", "<C-w>l", s)
map("", "<M-h>", [[<C-\><C-n><C-w>h]], s)
map("", "<M-j>", [[<C-\><C-n><C-w>j]], s)
map("", "<M-k>", [[<C-\><C-n><C-w>k]], s)
map("", "<M-l>", [[<C-\><C-n><C-w>l]], s)

-- Quick splits and tabs
map("n", "<leader>v", ":vsplit<CR>", s)
map("n", "<leader>x", ":split<CR>", s)
map("n", "<leader>t", ":tabnew <CR>", s)

-- Indents
map("n", "<", "<<", s)
map("n", ">", ">>", s)

-- Blank lines
map("n", "<leader>j", "o<ESC>k", s)
map("n", "<leader>k", "O<ESC>j", s)

-- Very Magic search
map("n", "/", [[/\v]], o)

-- Search and replace
map("n", "<leader>r", ":%s//g<Left><Left>", o)
map("v", "<leader>r", ":s//g<Left><Left>", o)

-- Clear search highlights
map("n", "<leader><CR>", ":nohls<CR>", s)

-- Inbuild terminal ESC normal mode
map("t", "<Esc>", [[<C-\><C-n>]], s)

-- Sigh... Things were not supposed to break like this
-- Open url under cursor into browser
map("n", "gx", "yiW:!xdg-open <cWORD><CR> <C-r>-- & <CR><CR>", o)

-- Create a new zettel note
map("n", "<leader>n", ":call CreateZettel()<CR>", s)

-- Open path under cursor in vertical split
map("n", "gf", ":vsplit <cfile><CR>", s)
