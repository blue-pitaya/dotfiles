" Vim plug is required
" Install it from https://github.com/junegunn/vim-plug

" ======== Plugins ========
call plug#begin()
Plug 'kyazdani42/nvim-web-devicons' " for file icons and for trouble plugin icons
Plug 'nvim-lua/plenary.nvim' " required for telescope and i think some other plugin
" Status bar
Plug 'nvim-lualine/lualine.nvim'
" Telescope (fuzzy finder)
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
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
" Code actions
Plug 'nvim-telescope/telescope-ui-select.nvim'
" Debugger
Plug 'mfussenegger/nvim-dap'
" Auto brackets
Plug 'jiangmiao/auto-pairs'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" File browser
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Tagbar
Plug 'preservim/tagbar'
Plug 'sidebar-nvim/sidebar.nvim'
Plug 'sidebar-nvim/sections-dap'
Plug 'simrat39/symbols-outline.nvim'
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
lua require('git_rc')

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

" ======== Colors ========
colorscheme cplex

hi Normal guibg=#0c0c0c
hi Comment guifg=#555555
hi Visual guibg=#4a499c
hi Error guibg=#7d0000 guifg=#cc9191
hi ErrorMsg guifg=#ffffff guibg=#7d0000
hi WarningMsg guifg=#d18828
hi LineNr ctermfg=243
hi VertSplit ctermfg=237 ctermbg=237
hi Pmenu guibg=#113200
hi DiffText ctermbg=88

" ======== Key maps ========
noremap <C-S> :update<CR>
inoremap <C-S> <Esc>:update<CR>
map <space> <nop>
tnoremap <Esc> <C-\><C-n>
vmap Y "+y
nnoremap <Leader>nh :nohlsearch<CR>

" Splitted navigation
nnoremap <C-Q> <C-W>q
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <leader>v :vs<CR>
nnoremap <leader>s :split<CR>
nnoremap <C-space> <C-W>r
nnoremap <CR> G
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

" Temporary config
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
command! -nargs=1 -complete=help H h <args> | only
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Prettier config (to check)
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
