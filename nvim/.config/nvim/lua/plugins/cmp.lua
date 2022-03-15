local cmp = require("cmp")

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    ["<CR>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"))
      elseif check_back_space() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  formatting = {
    fields = { "abbr", "kind" },
    format = function(_, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind] or "")
      return vim_item
    end,
  },
  documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "ultisnips" },
    { name = "treesitter" },
    { name = "path" },
    { name = "buffer" },
  }),
})
