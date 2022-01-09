vim.cmd [=[

function! MyHighlights()
  highlight! Normal guibg=none

  highlight! StatusLine gui=bold guibg=none guifg=#6272A4
  highlight! StatusLineNC guibg=none guifg=#424450
  highlight! StatusLineTerm gui=bold guibg=none guifg=#6272A4
  highlight! StatusLineTermNC guibg=none guifg=#424450

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
  highlight! link DiagnosticUnderlineHint NONE
  highlight! link DiagnosticUnderlineInfo NONE
  highlight! link DiagnosticUnderlineError NONE
  highlight! link DiagnosticUnderlineWarn NONE
  highlight! link LspDiagnosticsDefaultHint NonText
  highlight! link LspDiagnosticsDefaultInformation NonText
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

" Create a zettel hub (A collection of zettels)
function! CreateZettelHub(name)
  let title = a:name . ".md"

  " Add markdown link to new zettel hub
  execute "normal! i[".title."](./" . title . ")"

  " open new hub in vertical split
  execute "vsp  ~/MEGASync/notes/" . title

  " Add decorated title on top
  execute "r!figlet -ck " . a:name

  "Format to remove padding
  execute "Neoformat"

endfunction

" Create a zettel note (An atomic piece of info)
function! CreateZettel()

  " Get current time in seconds
  let now = strftime("%s")

  " Put line under cursor as title/file-name
  let cline = getline(".")
  let line = tolower(cline)
  let file = "./zettels/" . substitute(line, " ", "-", "g") . "-" . now . ".md"

  " Add markdown link to new zettel
  execute "normal! 0i[$a](" . file . ")"

  " open new zettel in vertical split
  execute "vsp " . file

  " Add title and date
  execute "normal! i# " . cline . "o## " . strftime("%c", now)

endfunction

]=]
