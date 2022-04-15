require("sidebar-nvim").setup({
  sections = { "buffers", require("dap-sidebar-nvim.breakpoints"), "symbols" },
  buffers = {
    icon = "",
    ignored_buffers = {}, -- ignore buffers by regex
    sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
    show_numbers = true, -- whether to also show the buffer numbers
  },
  dap = {
    breakpoints = {
      icon = "🔍"
    }
  },
  symbols = {
    icon = "ƒ",
  }
})
