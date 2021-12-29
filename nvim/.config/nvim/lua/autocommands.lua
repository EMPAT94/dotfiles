vim.cmd [=[

function! MyHighlights()
  highlight! Normal guibg=none
  highlight! Tabline gui=none guibg=none guifg=#6272A4
  highlight! TablineFill gui=none guifg=none guibg=none
  highlight! TablineSel gui=bold guibg=none guifg=#F1FA8C
  highlight! Folded gui=bold guibg=NONE guifg=#6272A4
  highlight! SpecialKey guibg=NONE
  highlight! SignColumn guibg=NONE
  highlight! Todo gui=bold,italic guibg=NONE guifg=Purple
  highlight! Search guibg=#707070
  highlight! VertSplit gui=none guifg=#6272a4 guibg=black
  highlight! Trail guifg=#FF5555
  match Trail /\s\+$/

  highlight! link GitSignsAdd NONE
  highlight! DiffAdd guibg=#254035 guifg=NONE gui=NONE
  highlight! DiffDelete guibg=#440000 guifg=NONE gui=NONE
  highlight! DiffChange guibg=#292929 guifg=NONE gui=NONE
  highlight! DiffText guibg=#252525 guifg=orange gui=underline

  highlight! link DiagnosticHint NonText
  highlight! link DiagnosticInfo NonText
  highlight! link DiagnosticSignHint NonText
  highlight! link DiagnosticSignInfo NonText
  highlight! link DiagnosticVirtualTextHint NonText
  highlight! link DiagnosticVirtualTextInfo NonText
  highlight! link LspDiagnosticsDefaultHint NonText
  highlight! link LspDiagnosticsDefaultInformation NonText
  highlight! link DiagnosticUnderlineHint NONE
  highlight! link DiagnosticUnderlineInfo NONE
  highlight! link DiagnosticUnderlineError NONE
  highlight! link DiagnosticUnderlineWarn NONE
  highlight! link LspDiagnosticsUnderlineHint NONE
  highlight! link LspDiagnosticsUnderlineInformation NONE
  highlight! link LspDiagnosticsUnderlineError NONE
  highlight! link LspDiagnosticsUnderlineWarning NONE
endfunction


function! TermOptions()
  if exists('b:termOptionsSet')
    return
  endif

  " Do not show number line
  setlocal nonu nornu
  " No offset
  setlocal scrolloff=0 sidescrolloff=0
  " Increase scrollback
  setlocal scrollback=10000
  " Enable terminal insert mode
  execute "startinsert"

  let b:termOptionsSet = '1'
endfunction

" Clear cmdline function
function! EmptyCmdline(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

]=]

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

]=]
