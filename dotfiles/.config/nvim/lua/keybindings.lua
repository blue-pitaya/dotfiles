-- vim.keymap.set ref:
-- https://github.com/neovim/neovim/pull/16591

-- General
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Paste text on visual without changing register content
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Diffview
vim.keymap.set("n", "<Leader>do", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<Leader>dc", ":DiffviewClose<CR>")
vim.keymap.set("n", "<Leader>dh", ":DiffviewFileHistory %<CR>")

-- LSP
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "J", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "L", "<cmd>lua vim.lsp.codelens.run()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references({show_line=false})<CR>")

vim.keymap.set("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")
vim.keymap.set("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("i", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

vim.keymap.set("n", "<leader>m", ":MetalsOrganizeImports<CR>")

-- File explorer
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Telescope
vim.keymap.set("n", "<Space><Space>", ":Telescope find_files<cr>")
vim.keymap.set("n", "<Space>g", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
vim.keymap.set("n", "<Space>r", ":Telescope resume<cr>")
vim.keymap.set("n", "<Space>j", ":Telescope buffers initial_mode=normal<cr>")
vim.keymap.set("n", "<Space>k", ":Telescope keymaps<cr>")
vim.keymap.set("n", "<Space>n", ":Telescope lsp_dynamic_workspace_symbols<cr>")
vim.keymap.set("n", "<Leader><Leader>", ":Telescope diagnostics initial_mode=normal layout_strategy=vertical<cr>")
vim.keymap.set("n", "<Space>h", ":Telescope help_tags<cr>")
vim.keymap.set("n", "<Space>s", ":Telescope git_status initial_mode=normal<cr>")

-- Telesopce: live grep selected text
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
vim.keymap.set('v', '<space>g', function()
	local text = vim.getVisualSelection()
	require('telescope.builtin').live_grep({ default_text = text })
end, { noremap = true, silent = true })


-- Debugging
vim.keymap.set("n", "<leader>b" , ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader><space>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.close();require'dapui'.close()<CR>")
vim.keymap.set("n", "<leader>l" , ":lua require'dap'.run_last()<CR>")
vim.keymap.set("n", "<leader>c" , ":lua require'dap'.run_to_cursor()<CR>")

vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<F2>", ":lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<leader>ov" , ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>in" , ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>ou" , ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>t" , ":lua require'dap'.repl.toggle()<CR>")
