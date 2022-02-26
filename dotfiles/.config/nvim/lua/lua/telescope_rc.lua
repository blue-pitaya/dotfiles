require('utils')

map("n", "<Space><Space>", ":Telescope find_files<cr>") 
map("n", "<Space>g", ":Telescope live_grep<cr>") 
map("n", "<Space>b", ":Telescope buffers<cr>") 
map("n", "<Space>r", "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>") 

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
  },
  extensions = {
  }
}
