" Vim plug is required
" Install it from https://github.com/junegunn/vim-plug
" ======== Plugins ========
call plug#begin()
Plug 'kyazdani42/nvim-web-devicons' " for file icons and for trouble plugin icons
Plug 'nvim-lua/plenary.nvim' " required for telescope and i think some other plugin
" Status bar
Plug 'nvim-lualine/lualine.nvim'
" Telescope (fuzzy finder)
" Needs: fd and rg (ripgrep) packages installed to work properly
Plug 'nvim-telescope/telescope.nvim'
" Git plugin
Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
" LSP config
Plug 'neovim/nvim-lspconfig'
" LSP error display
Plug 'folke/trouble.nvim'
" Scala plugin (syntax, lsp, code actions and more)
Plug 'scalameta/nvim-metals'
" Vue syntax highlight
Plug 'posva/vim-vue'
" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] } 
" C++ syntax highlight
Plug 'bfrg/vim-cpp-modern'
" HOCON syntax highlight (Typesafe config files)
Plug 'jvirtanen/vim-hocon'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
" Code actions
Plug 'nvim-telescope/telescope-ui-select.nvim'
" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
" Auto brackets
Plug 'jiangmiao/auto-pairs'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" File browser
Plug 'kyazdani42/nvim-tree.lua'
" Tagbar
Plug 'preservim/tagbar'
Plug 'sidebar-nvim/sidebar.nvim'
Plug 'sidebar-nvim/sections-dap'
" Apps
Plug 'itchyny/calendar.vim'
call plug#end()

" ======== Lua-based config ========
lua require('lsp_rc')
lua require('nvimtree_rc')
lua require('telescope_rc')
lua require('autocomplete_rc')
lua require('statusbar_rc')
lua require('sidebar_rc')
lua require('keybindings')
lua require('diffview_rc')
lua require('dap_rc')
lua require('misc')

" ======== Basic settings ========
set mouse=a
set number
set encoding=utf-8
set updatetime=750
set nomodeline

" Change tab to spaces
set expandtab
set shiftwidth=2
set tabstop=2

" Case insensitive search unless capital char exists
set ignorecase
set smartcase

" ======== Autocmds ========
autocmd BufNewFile,BufRead *.conf set filetype=hocon

" ======== Colors ========
colorscheme cplex

" ======== Key maps ========
noremap <C-S> :update<CR>
nnoremap S :wa<CR>
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

" Vim fugitive
nmap <leader>gs :Git<CR>

" ======= Snippets code ============
" No key for snippet extend because there is autocomplete now
" Jump forward or backward
let g:vsnip_snippet_dir = "~/.config/nvim/vsnip"
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

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

" QUickfix window (same when you exit telescope by ctrl+q) keybinding to open
" file under cursors
autocmd FileType qf nnoremap <buffer> o :.cc<CR>
" Set true color
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors
