local iron = require("iron.core")

iron.setup {
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_open_cmd = "vsp",
    repl_definition = { sh = { command = { "zsh" } }, clojure = require("iron.fts.clojure").clj },
  },
  keymaps = {
    send_motion = "<localleader>eo",
    visual_send = "<localleader>ev",
    send_line = "<localleader>el",
    send_mark = "<localleader>em",
    -- mark_motion = "<localleader>mc",
    -- mark_visual = "<localleader>mc",
    -- remove_mark = "<localleader>md>",
    -- cr = "<localleader>s<cr>",
    -- interrupt = "<localleader>s<localleader>",
    exit = "<localleader>eq",
    clear = "<localleader>ec",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = { italic = true, bold = true },
}

local s = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<localleader>e<CR>", ":IronRepl<CR>", s)
map("n", "<localleader>ee", [[:execute "normal va(,ev"<CR>]], s)
