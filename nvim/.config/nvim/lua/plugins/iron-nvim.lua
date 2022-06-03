local iron = require("iron.core")

iron.setup {
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_open_cmd = "vsp",
    repl_definition = { sh = { command = { "zsh" } }, clojure = require("iron.fts.clojure").clj },
  },
  keymaps = {
    -- mark_motion = "<localleader>mc",
    -- send_motion = "<localleader>ev",

    visual_send = "<localleader>ev",
    send_line = "<localleader>el",

    mark_visual = "<localleader>emn",
    remove_mark = "<localleader>emd",
    send_mark = "<localleader>eme",

    cr = "<localleader>s<cr>",
    interrupt = "<localleader>e<localleader>",
    exit = "<localleader>eq",
    clear = "<localleader>ec",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = { italic = true, bold = true },
}

local s = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<localleader>ee", [[:execute "normal {jva(,ev"<CR>]], s)
--
-- What does the above mapping do?
--
-- It is meant to execute "full" lisp functions from anywhere inside the body.
--
-- If your cursor is somewhere here, like so:
--
-- (defn [args]
--   (body1)
--   (body2) <cursor-here>
--   (body3))
--
--  Upon executing `,ee` cursor jumps a paragraph up, as designated by `{`
--  and drops down on the opening paragraph by `j`
--  Then selects the entire function by `va(`
--  And sends it for eval in repl (opens if not already so) using `,ev`
--
--  TODO: This albeit works only in lisps. Need to use tree-sitter to select objects later
