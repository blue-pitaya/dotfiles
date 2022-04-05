local cmp = require("cmp")

-- toggle cmp completion
vim.g.cmp_toggle_flag = false -- initialize
local normal_buftype = function()
  return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
end

local toggle_completion = function()
  local ok, cmp = pcall(require, "cmp")
  if ok then
    local next_cmp_toggle_flag = not vim.g.cmp_toggle_flag
    if next_cmp_toggle_flag then
      print("completion on")
    else
      print("completion off")
    end
    cmp.setup({
      enabled = function()
        vim.g.cmp_toggle_flag = next_cmp_toggle_flag
        if next_cmp_toggle_flag then
          return normal_buftype
        else
          return next_cmp_toggle_flag
        end
      end,
    })
  else
    print("completion not available")
  end
end

cmp.setup({
  completion = {
    autocomplete = true
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
