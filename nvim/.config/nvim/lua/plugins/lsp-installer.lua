local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "html",
  "jsonls",
  "pylsp",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "vuels",
  "yamlls",
}

require"nvim-lsp-installer".setup { automatic_installation = true }

local capabilities = require"cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementation<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<localleader>n", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<localleader>a", "<cmd>Telescope lsp_code_actions<CR>", opts)
  buf_set_keymap("n", "<localleader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

local lspconfig = require "lspconfig"

-- Extra config for some servers
local enhance_server_opts = {

  ["tailwindcss"] = function(opts)
    opts.root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts")
  end,

  -- If deno project, do not enable tsserver
  ["tsserver"] = function(opts)
    opts.root_dir = function(fname)
      local deno_root = lspconfig.util.root_pattern("deno.json")(fname)

      if (deno_root ~= nil) then
        return nil
      end

      local ts_root = lspconfig.util.root_pattern("tsconfig.json", "package.json")(fname)

      if (ts_root == nil) then
        opts.single_file_support = true
        return vim.fn.getcwd()
      end

      return ts_root
    end
  end,

  ["sumneko_lua"] = function(opts)
    opts.settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim", "describe", "it" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    }
  end,

  ["pylsp"] = function(opts)
    opts.settings = {
      configurationSources = { "pylint" },
      formatCommand = { "black" },
      pylsp = { plugins = { pycodestyle = { enabled = true, ignore = { "E501", "E231" }, maxLineLength = 90 } } },
    }
  end,
}

-- Start servers
for _, name in pairs(servers) do
  local opts = { on_attach = on_attach, capabilities = capabilities }

  if enhance_server_opts[name] then
    enhance_server_opts[name](opts)
  end

  lspconfig[name].setup(opts)
end

-- Does not show the diagnostics in buffer (use mapping <localleader>d instead)
vim.diagnostic.config({ virtual_text = false })
