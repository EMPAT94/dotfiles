" vim: set foldmarker={{,}} foldmethod=marker foldlevel=0:

if !has('nvim-0.5')
  echom "Config applicable only for neovim 0.5!"
  finish
endif

if exists('g:vscode')
  finish
endif

"---------- PLUGIN MANAGER---------- {{

" If vim-plug not present, install it.
let plug_dir=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(plug_dir)
  echo "Installing Vim-Plug..."
  exec "!" expand('curl') " -fLo " . shellescape(plug_dir) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Collection of common configurations for Neovim's built-in language server client.
Plug 'neovim/nvim-lspconfig'

" An implementation of the Popup API from vim in Neovim.
Plug 'nvim-lua/popup.nvim'

" Library of lua functions.
Plug 'nvim-lua/plenary.nvim'

" A highly extendable fuzzy finder over lists.
Plug 'nvim-telescope/telescope.nvim'

" Use fzf instead of builtin finder in telescope
Plug 'nvim-telescope/telescope-fzf-writer.nvim'

" Wraps the Neovim treesitter API to provide functionnalities such as highlighting and incremental selection,
" and a command to easily install parsers.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" A completion engine plugin for neovim written in Lua.
Plug 'hrsh7th/cmp-nvim-lsp'

" Completion Sources
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'

" A file system explorer for the Vim editor.
Plug 'preservim/nerdtree'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
" Plug 'kyazdani42/nvim-web-devicons'

" A dark theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

" Vim sugar for the UNIX shell commands
Plug 'tpope/vim-eunuch'

" Neovim plugin to comment text in and out, written in lua.
Plug 'b3nj5m1n/kommentary'

" Provides a single command that deletes the current buffer in a smart way.
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?
Plug 'tpope/vim-fugitive'

" A minimalist autopairs for Neovim written by Lua.
Plug 'windwp/nvim-autopairs'

" Git signs written in pure lua.
Plug 'lewis6991/gitsigns.nvim'

" Color highlighter for Neovim
Plug 'norcalli/nvim-colorizer.lua'

" Create a personal wiki using the Vim text editor.
Plug 'vimwiki/vimwiki', { 'on': [] }

"  Preview Markdown in real-time with a web browser.
Plug 'iamcco/markdown-preview.nvim'

" The interactive scratchpad for hackers.
Plug 'metakirby5/codi.vim', { 'on': [] }

" Distraction-free writing in Vim.
Plug 'junegunn/goyo.vim'

" UltiSnips is the ultimate solution for snippets in Vim.
Plug 'SirVer/ultisnips'

" A (Neo)vim plugin for formatting code.
Plug 'sbdchd/neoformat'

call plug#end()

command! LoadCodi execute "call plug#load('codi.vim') | Codi"
command! LoadWiki execute "call plug#load('vimwiki') | vsplit | VimwikiIndex"

" Language Servers https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" npm i -g typescript
" npm i -g typescript-language-server
" npm i -g bash-language-server
" npm i -g vscode-langservers-extracted
" npm i -g vim-language-server
" yay -S haskell-language-server _disabled in current config_
" yay -S lua-language-server

" Providers, Formatters, Linters
" npm i -g neovim
" pip install pynvim
" npm i -g prettier
" luarocks install --server=https://luarocks.org/dev luaformatter
"
" }}

"---------- GENERAL MAPPINGS ---------- {{

let mapleader = ","
let maplocalleader = " "

" Remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Colon switch
nnoremap ; :
vnoremap ; :

" Config change
noremap <silent> <leader>e :vsp ~/.config/nvim/init.vim<CR>

" Close, save and quit
noremap <silent> <leader>s :update<CR>
noremap <silent> <leader>q :Sayonara<CR>
noremap <silent> Q :Sayonara!<CR>

" Next & prev buffer
noremap <silent> gb :bprevious<CR>
noremap <silent> gB :bnext<CR>

" Split window jumps
noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l

" Quick vertical & horizontal split
noremap <silent> <leader>vn :vsplit<CR>
noremap <silent> <leader>vt :vsplit \| terminal <CR>
noremap <leader>vh :vertical help
noremap <leader>vj :vsplit \| terminal
noremap <silent> <leader>xn :split<CR>
noremap <silent> <leader>xt :split \| terminal <CR>
noremap <leader>xj :split \| terminal

" Quick tabs
nnoremap <silent> <leader>tn :tabnew <CR>
nnoremap <silent> <leader>tt :tabnew \| terminal <CR>
nnoremap <leader>th :tab help
nnoremap <leader>tj :tabnew \| terminal

" Yank till end of line
nnoremap Y yg_

" Indents
nnoremap < <<
nnoremap > >>

" Blank lines
nnoremap <leader>j o<ESC>k
nnoremap <leader>k O<ESC>j

" Very Magic search
nnoremap / /\v

" Search and replace
xnoremap <leader>r :s//g<Left><Left>
nnoremap <leader>r :%s//g<Left><Left>

" Clear search highlights
noremap <silent> <localleader><CR> :nohls<CR>

" Use tab for completion selection
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Inbuild terminal ESC normal mode
tnoremap <Esc> <C-\><C-n>

" Sigh... Things were not supposed to break like this
" Open url under cursor into browser
nmap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

" }}

"---------- EDITOR OPTIONS ---------- {{

" Enables full color mode
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set t_Co=256

" Name of the shell to use for ! and :! commands.
set shell=/bin/zsh

" Don't show mode in status line
set noshowmode

" String-encoding used internally and for |RPC| communication.
set encoding=UTF-8

" Enables mouse support for all modes
set mouse=a

" Natural splitting of windows
set splitright splitbelow

" Hybrid number line
set number relativenumber

" Case of normal letters in pattern is ignored unless capital
set ignorecase smartcase

" Convert tabs to spaces, one tab = 2 spaces, one indent = 2 spaces
set expandtab tabstop=2 shiftwidth=2

" Copy indent from previous line smartly
set smartindent autoindent

" Allows closing buffer windows without needing to save first
set hidden

" Do not create backup or swapfiles
set nobackup noswapfile nowritebackup

" Time after cursor no update after which to run autocmds
set updatetime=100

" Always show sign column beside the number line
set signcolumn=yes

" Use system clipboard for yank and delete by default
set clipboard=unnamedplus

" A comma separated list of word list names.
" When the 'spell' option is on spellchecking will be done for these languages.
set spelllang=en_us

" Shows the effects of a command incrementally, as you type, in a preview window
set inccommand=split

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5 sidescrolloff=5

" Number of screen lines to use for the command-line.
set cmdheight=2

" The screen will not be redrawn while executing macros, registers and other commands that have not been typed.
" Also, updating the window title is postponed.
set lazyredraw

" Minimal number of columns to use for the line number.
set numberwidth=5

" List mode on, but hide tabs.
set list listchars=tab:\ \ ,trail:·,extends:»,precedes:«

" Insert mode completion.
set completeopt=menu,menuone,noselect

" Don't give insert mode messages.
set shortmess+=c

" Don't fold on high-levels on start.
set foldlevel=10

" }}

"---------- GLOBAL VALUES ---------- {{

let g:node_host_prog = '/home/pritesh/.npm-global/lib/node_modules/neovim/bin/cli.js'
let g:python3_host_prog = "/usr/bin/python3"
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

let g:markdown_folding = 1

" }}

"---------- PLUGIN SETTINGS ---------- {{

" Telescope
nnoremap <C-t> <cmd>lua require('telescope').extensions.fzf_writer.files({
      \ previewer = false,
      \ prompt_title = "Files" })<cr>

nnoremap <silent> <C-p> :Telescope buffers<cr>

nnoremap gr <cmd>Telescope lsp_references<CR>

nnoremap <c-s> <cmd>lua require('telescope').extensions.fzf_writer.staged_grep({
      \ prompt_title = "grep" })<cr>

" Nerdtree
nnoremap <leader>z :NERDTreeToggle<CR>


" Goyo
let g:goyo_width = 120
let g:goyo_height = 90

noremap <silent> <leader><CR> :Goyo<CR>

" Vimwiki
let wiki_1 = {}
let wiki_1.path = "~/MEGASync/notes/private"
let wiki_1.syntax = "markdown"
let wiki_1.ext =  ".md"
let wiki_1.name = "Main Wiki"
let wiki_1.links_space_char = "_"

let wiki_2 = {}
let wiki_2.path = "~/Projects/empat94.github.io/_includes/notes"
let wiki_2.syntax = "markdown"
let wiki_2.ext =  ".md"
let wiki_2.name = "Code Wiki"
let wiki_2.links_space_char = "_"

let g:vimwiki_list = [wiki_1, wiki_2]

" Vimwiki has a feature called "Temporary Wikis",
" that will treat every file with configured file-extension as a wiki.
" Disable this feature
let g:vimwiki_global_ext = 0
let g:vimwiki_folding='custom'

" Character that is used to show that an item of a todo list will not be done.
let g:vimwiki_listsym_rejected = '✗'

" Fugitive
nnoremap <silent> <localleader>s :G<CR>
nnoremap <silent> <localleader>d :Gvdiffsplit<CR>

let g:fugitive_no_maps = 1

" Treesiter based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Lightline
let g:lightline = { 'colorscheme': 'simpleblack' }

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'dir', 'branch', 'filename', 'modified' ] ],
      \ 'right': [ [ 'date' ] ] }
let g:lightline.inactive = {
      \ 'left': [ [ 'relativepath', 'modified' ] ],
      \ 'right': [] }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [] }
let g:lightline.component_function = { 'branch': 'FugitiveHead', 'dir': 'Dir'}

function! Dir()
  return fnamemodify(getcwd(), ':t')
endfunction

" Neoformat
nnoremap <leader>p :Neoformat<CR>

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" }}

"---------- LUA CODE ---------- {{

" See lua/init.lua
lua require("init")

" }}

"---------- GENERAL AUTO COMMANDS ---------- {{

augroup CustomCmds
  autocmd!
  " Blink yanked text
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()

  " Set custom highlights
  autocmd ColorScheme * call MyHighlights()

  " Auto load vimwiki if opening notes
  autocmd VimEnter */notes/** call plug#load('vimwiki')

  " Set custom terminal options on open
  autocmd TermOpen * call TermOptions()

  " Clear commandline after 5 seconds
  autocmd CmdlineLeave : call timer_start(3000, funcref('s:empty_message'))

  " Start java lsp for java files
  " autocmd FileType java lua require'jdtls_config'.setup()

  " Start lua lsp for lua files
  autocmd FileType java lua require'luals_config'.setup()
augroup END

function! MyHighlights()
  highlight Normal guibg=none
  highlight LineNr guibg=NONE
  highlight Folded gui=bold guibg=NONE guifg=#6272A4
  highlight SpecialKey guibg=NONE
  highlight SignColumn guibg=NONE
  highlight Todo gui=bold,italic guibg=NONE guifg=Purple
  highlight Search guibg=#a8a8a8
  highlight Trail guifg=Red
  match Trail /\s\+$/

  highlight! link GitSignsAdd NONE
  highlight DiffAdd guibg=#254035 guifg=NONE gui=NONE
  highlight DiffDelete guibg=#440000 guifg=NONE gui=NONE
  highlight DiffChange guibg=#292929 guifg=NONE gui=NONE
  highlight DiffText guibg=#252525 guifg=orange gui=underline

  highlight link LspDiagnosticsDefaultHint NonText
  highlight link LspDiagnosticsDefaultInformation NonText
  highlight link LspDiagnosticsUnderlineHint NONE
  highlight link LspDiagnosticsUnderlineInformation NONE
  highlight link LspDiagnosticsUnderlineError NONE
  highlight link LspDiagnosticsUnderlineWarning NONE
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
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

" }}

"---------- OTHER SETTINGS ---------- {{

colorscheme dracula

" When on, ":autocmd", shell and write commands are not allowed in
" .nvimrc and .exrc in the current directory and map commands are displayed.
set secure

" }}
