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
" LSP config
Plug 'neovim/nvim-lspconfig'
" LSP error display
Plug 'folke/trouble.nvim'
" Scala plugin (syntax, lsp, code actions and more)
Plug 'scalameta/nvim-metals'
" Vue syntax highlight
Plug 'posva/vim-vue'
" C++ syntax highlight
Plug 'bfrg/vim-cpp-modern'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
" Code actions
Plug 'weilbith/nvim-code-action-menu'
" Auto brackets
Plug 'rstacruz/vim-closer'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" File browser
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

" ======== Lua-based config ========
lua require('lsp_rc')
lua require('nvimtree_rc')
lua require('telescope_rc')
lua require('autocomplete_rc')
lua require('statusbar_rc')

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

" Vim fugitive
nmap <leader>gs :Git<CR><C-w>8-

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
