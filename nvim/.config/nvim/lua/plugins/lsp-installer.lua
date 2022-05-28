local lsp_installer = require "nvim-lsp-installer"

-- the servers to install by default
local servers = {
  "bashls",
  "clojure_ls",
  "cssls",
  "dockerls",
  "elixirls",
  "html",
  "jsonls",
  "pyright",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "vimls",
  "vuels",
  "yamlls",
  "nimls", -- Ensure nim/nimble is installed through choosenim (package manager route gives compile error)
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
end

local enhance_server_opts = {
  ["tsserver"] = function(opts)
    opts.single_file_support = true
  end,

  ["sumneko_lua"] = function(opts)
    opts.settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim", "describe", "it" } },
        -- workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    }
  end,
}

lsp_installer.on_server_ready(function(server)
  local opts = { on_attach = on_attach, capabilities = capabilities }

  if enhance_server_opts[server.name] then
    enhance_server_opts[server.name](opts)
  end

  server:setup(opts)
end)
