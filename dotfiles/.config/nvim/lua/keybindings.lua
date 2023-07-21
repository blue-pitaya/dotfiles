-- vim.keymap.set ref:
-- https://github.com/neovim/neovim/pull/16591

-- General
vim.keymap.set("n", "<C-S>", ":update<CR>")
vim.keymap.set("i", "<C-S>", "<ESC>:update<CR>")
vim.keymap.set("n", "<Space>", "<nop>")
vim.keymap.set("v", "Y", '"+y') --copy to system-wide register
vim.keymap.set("n", "<Leader>nh", ":nohlsearch<CR>")
vim.keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')
vim.keymap.set("n", "vil", "^vg_")
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set("x", "<leader>p", "\"_dP") -- Paste text on visual without changing register content
vim.keymap.set("n", "<Leader>q", ":tabclose<CR>")
vim.keymap.set("n", "<C-P>", ":tabnext<CR>")

vim.keymap.set("n", "<Leader>c", ":ToggleCompletion<CR>")

vim.cmd([[autocmd FileType qf nnoremap <buffer> o :.cc<CR>]]) -- open file in qf window

-- Window bindings
vim.keymap.set("n", "<C-Q>", "<C-W>q")
vim.keymap.set("n", "<C-J>", "<C-W>j")
vim.keymap.set("n", "<C-K>", "<C-W>k")
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-L>", "<C-W>l")
vim.keymap.set("n", "+", "<C-W>+")
vim.keymap.set("n", "-", "<C-W>-")
vim.keymap.set("n", "<leader>v", ":vs<CR>")
vim.keymap.set("n", "<leader>s", ":split<CR>")
vim.keymap.set("n", "<C-space>", "<C-W>r")

-- Diffview
vim.keymap.set("n", "<Leader>do", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<Leader>dh", ":DiffviewFileHistory %<CR>")

-- LSP
vim.keymap.set("n", "gd", function() require'telescope.builtin'.lsp_definitions({show_line=false, initial_mode='normal'}) end)
vim.keymap.set("n", "J",  function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "K",  function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "L",  function() vim.lsp.codelens.run() end)
vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
vim.keymap.set("n", "gr", function() require'telescope.builtin'.lsp_references({show_line=false, initial_mode='normal'}) end)

vim.keymap.set("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")
vim.keymap.set("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("i", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("i", "<C-J>", function() vim.lsp.buf.code_action() end)

vim.keymap.set("n", "<leader>m", ":MetalsOrganizeImports<CR>")

-- File explorer
--vim.keymap.set("n", "<C-N>", function () vim.cmd("Explore") end)
vim.keymap.set("n", "<C-N>", function () vim.cmd("Neotree toggle") end)

-- Telescope
vim.keymap.set("n", "<Space><Space>", ":Telescope find_files<cr>")
vim.keymap.set("n", "<Space>g", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
vim.keymap.set("n", "<Space>r", ":Telescope resume<cr>")
vim.keymap.set("n", "<Space>j", ":Telescope buffers initial_mode=normal<cr>")
vim.keymap.set("n", "<Space>k", ":Telescope keymaps<cr>")
vim.keymap.set("n", "<Space>n", ":Telescope lsp_dynamic_workspace_symbols<cr>")
vim.keymap.set("n", "<Leader><Leader>", function() require('telescope.builtin').diagnostics({line_width='full', layout_strategy='vertical', initial_mode='normal'}) end)
vim.keymap.set("n", "<Space>h", ":Telescope help_tags<cr>")
vim.keymap.set("n", "<Space>p", ":Telescope neoclip initial_mode=normal<cr>")
vim.keymap.set("n", "<Space>s", function ()
  require('telescope.builtin').git_status()
end)

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
vim.keymap.set("n", "<F9>", ":lua require'dap'.continue()<CR>")
--vim.keymap.set("n", "<F10>", ":lua require'dap'.close();require'dapui'.close()<CR>")
--vim.keymap.set("n", "<leader>l" , ":lua require'dap'.run_last()<CR>")
--vim.keymap.set("n", "<leader>c" , ":lua require'dap'.run_to_cursor()<CR>")
--vim.keymap.set("n", "<F2><F2>", ":lua require'dapui'.toggle()<CR>")
--vim.keymap.set("n", "<leader>ov" , ":lua require'dap'.step_over()<CR>")
--vim.keymap.set("n", "<leader>in" , ":lua require'dap'.step_into()<CR>")
--vim.keymap.set("n", "<leader>ou" , ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F2>" , ":lua require'dap'.repl.toggle()<CR>")

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
    desc = "Open Spectre"
})
--vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
--    desc = "Search current word"
--})
--vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
--    desc = "Search current word"
--})
--vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
--    desc = "Search on current file"
--})
