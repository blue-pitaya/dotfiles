require('utils')

map("n", "<Space><Space>", ":Telescope find_files<cr>") 
map("n", "<Space>g", ":Telescope live_grep<cr>") 
map("n", "<Space>b", ":Telescope buffers<cr>") 
map("n", "<Space>r", "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>") 
map("n", "<Space>n", ":Telescope file_browser<cr>") 

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous"
      }
    },
    file_ignore_patterns = { "project/target", "project/project", "target" }
  },
  pickers = {
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension("ui-select")
