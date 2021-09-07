require('telescope').setup { 
 extensions = {
   fzf_writer = {
     minimum_grep_characters = 2,
     minimum_files_characters = 2,
     use_highlighter = true,
   }
 },
 defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close
      },
    },
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  }
}


local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead guibg=Grey gui=bold
      hi LspReferenceText guibg=Grey gui=bold
      hi LspReferenceWrite guibg=Grey gui=bold
    ]], false)
  end
end

local servers = { "jsonls", "cssls", "bashls", "html", "hls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach, capabilities = capabilities, }
end

-- Start tsserver without needing default root_dir
nvim_lsp["tsserver"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(filename)
    return vim.fn.getcwd()
  end;
}

require('compe').setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 2,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    nvim_lsp = { priority = 10, sort = false },
    path = { priority = 9 },
    snippets_nvim = { priority = 9 },
    buffer = { priority = 8 },
  },
}

require('colorizer').setup()

require('gitsigns').setup{
  signs = {
    add = { hl = 'DraculaGreen', text = '▐' },
    change = { hl = 'DraculaYellow', text = '▐' },
    delete = { hl = 'DraculaRed', text = '▬' },
    topdelete = { hl = 'DraculaRed', text = '▬' },
    changedelete = { hl = 'DraculaOrange', text = '▐' },
  },
 }

-- Temporarily disable tabline due to bug
-- require('statusline').tabline = false

require('nvim-autopairs').setup()

-- Enable bracket spread on CR
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
_G.MUtils= {}
vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      vim.fn["compe#confirm"]()
      return npairs.esc("<c-y>")
    else
      vim.defer_fn(function()
        vim.fn["compe#confirm"]("<cr>")
      end, 20)
      return npairs.esc("<c-n>")
    end
  else
    return npairs.check_break_line_char()
  end
end
remap('i', '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
