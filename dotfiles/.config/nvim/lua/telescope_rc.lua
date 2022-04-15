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
        ["<C-h>"] = "which_key"
      }
    },
    file_ignore_patterns = { "project/target", "project/project", "target" }
  },
  pickers = {
  },
  extensions = {
  }
}

require("telescope").load_extension "file_browser"
