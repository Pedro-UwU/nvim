local lsp = require('lsp-zero')
lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<C-j>'] = cmp.mapping.select_next_item(cmp_select)
cmp_mappings['<C-k>'] = cmp.mapping.select_prev_item(cmp_select)
cmp_mappings['<C-l>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace})

local cmp_window = {
    documentation = {
      max_height = 15,
      max_width = 60,
    }
}

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'pylsp', 'java-language-server', 'eslint', 'rust_analyzer' },
    handlers = {
        lsp.default_setup,
    }
})



cmp.setup({
	mapping = cmp_mappings,
    window = cmp_window,
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'copilot'},
        {name = 'path'},
        {name = 'text'},
        {name = 'buffer'},
        {name = 'snippets_nvim'},
        {name = 'luasnip'}
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
