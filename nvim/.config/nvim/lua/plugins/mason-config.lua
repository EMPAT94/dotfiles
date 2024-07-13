local servers = {
	"bashls",
	"cssls",
	"dockerls",
	"elixirls",
	"html",
	"jsonls",
	"lua_ls",
	"pylsp",
	"tsserver",
	"vimls",
	"yamlls",
	-- "denols",
	"docker_compose_language_service",
	-- "cssmodules_ls",
}

require("mason-lspconfig").setup({})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
	buf_set_keymap("n", "<localleader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("v", "<localleader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<localleader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

local lspconfig = require("lspconfig")

-- Extra config for some servers
local enhance_server_opts = {

	["tailwindcss"] = function(opts)
		opts.root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts")
	end,

	-- If deno project, do not enable tsserver
	["tsserver"] = function(opts)
		opts.root_dir = function(fname)
			local deno_root = lspconfig.util.root_pattern("deno.jsonc")(fname)

			if deno_root ~= nil then
				return nil
			end

			local ts_root = lspconfig.util.root_pattern("tsconfig.json", "package.json")(fname)

			if ts_root == nil then
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
			configurationSources = { "ruff" },
			formatCommand = { "black" },
			pylsp = { plugins = { pycodestyle = { enabled = true, ignore = { "E501", "E231" }, maxLineLength = 90 } } },
		}
	end,

	["ltex"] = function(opts)
		-- this is like the grammarly thingy
		opts.filetypes = { "markdown", "text", "latex" }
	end,

	["sourcekit"] = function(opts)
		opts.single_file_support = true
	end,

	["kotlin_language_server"] = function(opts)
		opts.single_file_support = true
	end,
}

for _, name in pairs(servers) do
	local opts = { on_attach = on_attach, capabilities = capabilities }

	if enhance_server_opts[name] then
		enhance_server_opts[name](opts)
	end

	lspconfig[name].setup(opts)
end

-- Does not show the diagnostics in buffer (use mapping <localleader>d instead)
vim.diagnostic.config({ virtual_text = false })

-- Installed packages list:
-- ◍ bash-language-server bashls (keywords: bash)
-- ◍ beautysh (keywords: bash, csh, ksh, sh, zsh)
-- ◍ black (keywords: python)
-- ◍ css-lsp cssls (keywords: css, scss, less)
-- ◍ cssmodules-language-server cssmodules_ls (keywords: css)
-- ◍ docker-compose-language-service docker_compose_language_service (keywords: docker)
-- ◍ dockerfile-language-server dockerls (keywords: docker)
-- ◍ html-lsp html (keywords: html)
-- ◍ json-lsp jsonls (keywords: json)
-- ◍ lua-language-server lua_ls (keywords: lua)
-- ◍ markdownlint (keywords: markdown)
-- ◍ prettierd (keywords: angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml)
-- ◍ python-lsp-server pylsp (keywords: python)
-- ◍ sql-formatter (keywords: sql)
-- ◍ sqlls (keywords: sql)
-- ◍ stylua (keywords: lua, luau)
-- ◍ typescript-language-server tsserver (keywords: typescript, javascript)
-- ◍ vim-language-server vimls (keywords: vimscript)
-- ◍ yaml-language-server yamlls (keywords: yaml)
