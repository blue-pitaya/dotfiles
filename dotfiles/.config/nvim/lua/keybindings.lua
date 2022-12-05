require('utils')

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

-- General
map('n', '<C-o>', '<C-o>zz')
map('n', '<C-i>', '<C-i>zz')

-- Diffview
map("n", "<Leader>do", ":DiffviewOpen<CR>")
map("n", "<Leader>dc", ":DiffviewClose<CR>")
map("n", "<Leader>dh", ":DiffviewFileHistory %<CR>")

-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "J", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "L", "<cmd>lua vim.lsp.codelens.run()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references({show_line=false})<CR>") 

map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")
map("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("i", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

map("n", "<leader>m", ":MetalsOrganizeImports<CR>")

-- File explorer
map("n", "<C-n>", ":NvimTreeToggle<CR>") 

-- Telescope
map("n", "<Space><Space>", ":Telescope find_files<cr>") 
map("n", "<Space>g", ":Telescope live_grep<cr>") 
map("n", "<Space>r", ":Telescope resume<cr>") 
map("n", "<Space>b", ":Telescope buffers<cr>") 
map("n", "<Space>k", ":Telescope keymaps<cr>") 
map("n", "<Space>n", ":Telescope lsp_dynamic_workspace_symbols<cr>") 

vim.keymap.set('v', '<space>g', function()
	local text = vim.getVisualSelection()
	require('telescope.builtin').live_grep({ default_text = text })
end, { noremap = true, silent = true })

-- Sidebar
map("n", "<C-B>", ":SidebarNvimToggle<CR>")

-- Debugging
map("n", "<leader>b" , ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<leader><space>", ":lua require'dap'.continue()<CR>")
map("n", "<F10>", ":lua require'dap'.close();require'dapui'.close()<CR>")
map("n", "<leader>l" , ":lua require'dap'.run_last()<CR>")
map("n", "<leader>c" , ":lua require'dap'.run_to_cursor()<CR>")

map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<F2>", ":lua require'dapui'.toggle()<CR>")
map("n", "<leader>ov" , ":lua require'dap'.step_over()<CR>")
map("n", "<leader>in" , ":lua require'dap'.step_into()<CR>")
map("n", "<leader>ou" , ":lua require'dap'.step_out()<CR>")
map("n", "<leader>t" , ":lua require'dap'.repl.toggle()<CR>")
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>

-- Other
-- map("n", "<leader>ec", ":echo synIDattr(synIDtrans(synID(line(\".\"), col(\".\"), 1)), \"name\")<CR>") --print color name under cursor
