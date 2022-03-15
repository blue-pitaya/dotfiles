local cmp = require("cmp")

local normal_buftype = function()
  return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
end

vim.g.cmp_toggle_flag = false
-- Dirty hack. For first use autocomplete flag must be set to false. Then is 
-- alwyes set to default value (TextChange) and autocompletion is controlled
-- by enable flag. Otherwise autocomple is always on at start and you have to
-- turn it off twice for some reason.
vim.g.cmp_first_time = true

local toggle_completion = function()
  if vim.g.cmp_first_time then
    vim.g.cmp_firt_time = false
    cmp.setup({
      completion = { 
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
      }
    })
  end

  vim.g.cmp_toggle_flag = not vim.g.cmp_toggle_flag

  cmp.setup({
    enabled = function()
      if vim.g.cmp_toggle_flag then
        return normal_buftype
      else
        return false
      end
    end,
  })
end

cmp.setup({
  completion = {
    autocomplete = false
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<C-j>"] = cmp.mapping({
      i = function()
        if cmp.visible() then
          cmp.abort()
          toggle_completion()
        else
          cmp.complete()
          toggle_completion()
        end
      end,
    }),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          toggle_completion()
        else
          fallback()
        end
      end,
    }),
  },
})
