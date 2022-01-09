require("gitsigns").setup {
  signs = {
    add = {
      hl = "DraculaGreen",
      text = "▐",
    },
    change = {
      hl = "DraculaYellow",
      text = "▐",
    },
    delete = {
      hl = "DraculaRed",
      text = "▬",
    },
    topdelete = {
      hl = "DraculaRed",
      text = "▬",
    },
    changedelete = {
      hl = "DraculaOrange",
      text = "▐",
    },
  },
  keymaps = {
    noremap = true,
    ["n ]c"] = {
      expr = true,
      "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
    },
    ["n [c"] = {
      expr = true,
      "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
    },
    ["n <localleader>p"] = "<cmd>Gitsigns preview_hunk<CR>",
    ["n <localleader>s"] = "<cmd>Gitsigns stage_hunk<CR>",
    ["n <localleader>u"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
    ["n <localleader>r"] = "<cmd>Gitsigns reset_hunk<CR>",
  },
}
