" Packer required: https://github.com/wbthomason/packer.nvim

" ======== Basic settings ========
set mouse=a
set number
set encoding=utf-8
set updatetime=750
set nomodeline
set termguicolors
set signcolumn=no

" Change tab to spaces
set expandtab
set shiftwidth=2
set tabstop=2
set list
set listchars=tab:⦁.

" Case insensitive search unless capital char exists
set ignorecase
set smartcase

" ======== Lua-based config ========
lua require('colors')
lua require('plugins')

lua require('lsp_rc')
lua require('telescope_rc')
lua require('autocomplete_rc')
lua require('statusbar_rc')
lua require('keybindings')
lua require('diffview_rc')
lua require('dap_rc')
lua require('snippy_rc')
lua require('leap_rc')
lua require('treesitter_rc')
lua require('neotree_rc')
lua require('window-picker_rc')

" ======== Autocmds ========
autocmd BufNewFile,BufRead *.conf set filetype=hocon

" ======== Key maps ========
noremap <C-S> :update<CR>
"nnoremap S :wa<CR>
inoremap <C-S> <Esc>:update<CR>
map <space> <nop>
map <CR> <nop>
tnoremap <Esc> <C-\><C-n>
vmap Y "+y
nnoremap <Leader>nh :nohlsearch<CR>

" Search and replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
nnoremap vil ^vg_

" Splitted navigation
nnoremap <C-Q> <C-W>q
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap <leader>v :vs<CR>
nnoremap <leader>s :split<CR>
nnoremap <C-space> <C-W>r
nnoremap <C-W><C-W> <C-W>69+

" Dev icons fix
command! -nargs=1 -complete=help H h <args> | only
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Prettier config (to check)
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" Close all floating windows
nnoremap <silent> <leader>zc :lua for _, win in ipairs(vim.api.nvim_list_wins()) do local config = vim.api.nvim_win_get_config(win); if config.relative ~= "" then vim.api.nvim_win_close(win, false); print('Closing window', win) end end<CR>

" Quickfix window (same when you exit telescope by ctrl+q) keybinding to open file under cursors
autocmd FileType qf nnoremap <buffer> o :.cc<CR>
