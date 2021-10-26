-- TODO Split into multiple files
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close,
      },
    },
  },
}

require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}

local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local opts = {
    noremap = true,
    silent = true,
  }

  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>n", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead guibg=Grey gui=bold
      hi LspReferenceText guibg=Grey gui=bold
      hi LspReferenceWrite guibg=Grey gui=bold
    ]], false)
  end
end

local servers = { "jsonls", "cssls", "bashls", "html" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Start tsserver without needing default root_dir
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.fn.getcwd()
  end,
}

-- Setup Lua Language Server
-- This was installed using `yay -S lua-language-server`
local sumneko_binary = "/usr/bin/lua-language-server"
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  cmd = { sumneko_binary },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim", "describe", "it" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  documentation = {
    maxheight = 180,
  },
  mapping = {
    ["<TAB>"] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
    ["<C-n>"] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
    ["<C-p>"] = cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    {
      name = "nvim_lsp",
    },
    {
      name = "ultisnips",
    },
    {
      name = "treesitter",
    },
    {
      name = "path",
    },
    {
      name = "buffer",
    },
  },
})

require("colorizer").setup()

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
}

require("nvim-autopairs").setup()

-- Enable bracket spread on CR
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")
_G.MUtils = {}
vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
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

remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", {
  expr = true,
  noremap = true,
})
