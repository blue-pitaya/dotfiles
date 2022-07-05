require('utils')

-- Autocompletion
-- toggle
map("n", "<leader>a", "<cmd>lua my_cmp_toggle()<cr>")

-- Diffview
map("n", "<Leader>do", ":DiffviewOpen<CR>")
map("n", "<Leader>dc", ":DiffviewClose<CR>")

-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "J", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "L", "<cmd>lua vim.lsp.codelens.run()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>") 
map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("i", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

-- File explorer
map("n", "<C-n>", ":NvimTreeToggle<CR>") 

-- Telescope
map("n", "<Space><Space>", ":Telescope find_files<cr>") 
map("n", "<Space>g", ":Telescope live_grep<cr>") 
map("n", "<Space>b", ":Telescope buffers<cr>") 
map("n", "<Space>n", ":Telescope oldfiles<cr>") 
map("n", "<Space>k", ":Telescope keymaps<cr>") 

-- Debugging
map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<F10>" , ":lua require'dap'.step_over()<CR>")
map("n", "<F11>" , ":lua require'dap'.step_into()<CR>")
map("n", "<F12>" , ":lua require'dap'.step_out()<CR>")
map("n", "<leader>b" , ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<leader>t" , ":lua require'dap'.repl.toggle()<CR>")
map("n", "<leader>l" , ":lua require'dap'.run_last()<CR>")
map("n", "<leader>i" , ":lua require'dap.ui.widgets'.hover()<CR>")
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
