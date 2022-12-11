vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- for file icons and for trouble plugin icons
  use 'kyazdani42/nvim-web-devicons'
  -- required for telescope and i think some other plugin
  use 'nvim-lua/plenary.nvim'
  -- Status bar
  use 'nvim-lualine/lualine.nvim'
  -- Telescope (fuzzy finder)
  -- Needs: fd and rg (ripgrep) packages installed to work properly
  use 'nvim-telescope/telescope.nvim'
  -- Git plugin
  use 'tpope/vim-fugitive'
  use 'sindrets/diffview.nvim'
  -- LSP config
  use 'neovim/nvim-lspconfig'
  -- LSP error display
  use 'folke/trouble.nvim'
  -- Scala plugin (syntax, lsp, code actions and more)
  use 'scalameta/nvim-metals'
  -- Vue syntax highlight
  use 'posva/vim-vue'
  -- Prettier
  use  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'}
  }
  -- C++ syntax highlight
  use 'bfrg/vim-cpp-modern'
  -- HOCON syntax highlight (Typesafe config files)
  use 'jvirtanen/vim-hocon'
  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'dcampos/cmp-snippy'
  -- Code actions
  use 'nvim-telescope/telescope-ui-select.nvim'
  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  -- Auto brackets
  use 'jiangmiao/auto-pairs'
  -- Snippets
  use 'dcampos/nvim-snippy'
  -- File browser
  use 'kyazdani42/nvim-tree.lua'
  -- Tagbar
  use 'preservim/tagbar'
  use 'sidebar-nvim/sidebar.nvim'
  use 'sidebar-nvim/sections-dap'
  use {
    'ggandor/leap.nvim',
    requires = {"tpope/vim-repeat"}
  }
  -- Nginx syntax highlight
  use 'chr4/nginx.vim'
  -- Extended live grep on telescope
  use "nvim-telescope/telescope-live-grep-args.nvim"
end)
