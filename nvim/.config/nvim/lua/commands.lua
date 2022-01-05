vim.cmd [=[

augroup CustomCmds
  autocmd!
  " Blink yanked text
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()

  " Set custom highlights
  autocmd ColorScheme * call MyHighlights()

  " Set custom terminal options on open
  autocmd TermOpen * call TermOptions()

  " Clear commandline after 5 seconds
  autocmd CmdlineLeave : call timer_start(2000, funcref('EmptyCmdline'))

  " Start java lsp for java files
  " autocmd FileType java lua require'jdtls_config'.setup()

  " Disable nvim-cmp on the specific buffer
  autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END

command! -nargs=1 CreateZettelHub :call CreateZettelHub(<args>)

]=]
