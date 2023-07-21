--General
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.encoding = "utf-8"
vim.opt.modeline = false
--vim.opt.signcolumn = "no"
vim.opt.wrap = true

-- Change tab to spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Show tabs
vim.opt.list = true
vim.opt.listchars = "tab:⦁."
vim.opt.fillchars:append { diff = "╱" }

-- Case insensitive search unless capital char exists
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Colorscheme and plugins
vim.cmd('colorscheme pitaya')
require('plugins')

vim.cmd([[autocmd VimEnter * :clearjumps]])

-- Custom globals
vim.g.cmp_is_enabled = true
vim.g.diagnostics_virtual_text_enabled = true

-- Plugins rc
require('lsp_rc')
require('telescope_rc')
require('autocomplete_rc')
require('statusbar_rc')
require('keybindings')
require('diffview_rc')
require('dap_rc')
require('snippy_rc')
require('leap_rc')
require('treesitter_rc')
require('neotree_rc')
require('window-picker_rc')

-- Prettier config (to check)
vim.cmd([[let g:prettier#autoformat = 1]])
vim.cmd([[let g:prettier#autoformat_require_pragma = 0]])

-- What is it?
vim.cmd([[let g:LanguageClient_serverCommands = {'vue': ['vls']}]])
