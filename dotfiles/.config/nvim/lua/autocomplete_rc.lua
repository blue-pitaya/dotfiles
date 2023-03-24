local cmp = require("cmp")

vim.g.cmp_toggle_flag = true -- autocompletion on by default

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
    entries_win = {
      wrap = true,
    }
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
    { name = "snippy" },
    { name = "nvim_lsp" },
  },
  experimental = {
    ghost_text = true
  }
})
