-- TODO Split into multiple files
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      prompt_prefix = "",
    },
    buffers = {
      prompt_title = "Find Buffer",
      prompt_prefix = "",
    },
    live_grep = {
      prompt_prefix = "",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}

require("telescope").load_extension("fzf")

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

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

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
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = cmp.config.sources({
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
  }, {
    {
      name = "buffer",
    },
  }),
})

_G.tab_selection = function()
  if cmp.visible() then
    vim.fn.feedkeys(t("<C-n>"), "")
  elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    return vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"))
  elseif check_back_space() then
    vim.fn.feedkeys(t("<tab>"), "")
  else
    cmp.mapping.complete()
  end
end

_G.S_tab_selection = function()
  if cmp.pumvisible() then
    vim.fn.feedkeys(t("<C-p>"), "")
  elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
    vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
  else
    vim.fn.feedkeys(t("<tab>"), "")
  end
end

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
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

require("nvim-rss").setup({
  feeds_dir = "~/.config/nvim",
})
