local cmp = require("cmp")
require('utils')

vim.g.cmp_toggle_flag = true -- autocompletion on by default
function my_cmp_toggle()
  local ok, cmp = pcall(require, "cmp")
  if ok then
    vim.g.cmp_toggle_flag = not vim.g.cmp_toggle_flag
    cmp.setup({
      enabled = vim.g.cmp_toggle_flag,
    })
  else
    print("completion not available")
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  window = {
    completion = {
      border = 'rounded',
      scrollbar = '',
    },
    documentation = {
      border = 'rounded',
      scrollbar = '',
    },
  },
  mapping = {
    ['<tab>'] = cmp.mapping.select_next_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-h>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "snippy" },
  },
  experimental = {
    ghost_text = true
  }
})
