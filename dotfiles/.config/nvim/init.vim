" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" ======== Plugins ========
call plug#begin()
" Telescope (fuzzy finder)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Colorscheme
Plug 'mangeshrex/uwu.vim'
" Git plugin
Plug 'tpope/vim-fugitive'
" Scala plugin
Plug 'scalameta/nvim-metals'
" Vue plugin
Plug 'posva/vim-vue'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip' " This can be removed laters (i dont need support for snippets)
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" File browser
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" todo: add nvim-dap later for debuggind options
call plug#end()

" ======== Lua-based config ========
lua require('lsp_rc')
lua require('nvimtree_rc')
lua require('telescope_rc')
lua require('autocomplete_rc')

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
colorscheme uwu

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

" ======= Snippets code ============
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


let g:vsnip_snippet_dir = "~/.config/nvim/vsnip"
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
