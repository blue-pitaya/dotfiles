vim.cmd [[packadd packer.nvim]]
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return require('packer').startup(function(use)
  -- Packer itself :)
  use 'wbthomason/packer.nvim'
  -- Required for telescope and other plugins
  use 'nvim-lua/plenary.nvim'
  -- File browser
  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.5'
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  -- Status bar
  use 'nvim-lualine/lualine.nvim'
  -- Telescope (fuzzy finder)
  -- Needs: fd and rg (ripgrep) packages installed to work properly
  use 'blue-pitaya/telescope.nvim'
  use {
    'nvim-telescope/telescope-live-grep-args.nvim',
    commit = '7de3bae'
  }
  use {
    'nvim-telescope/telescope-ui-select.nvim', -- Code actions
    commit = '62ea5e5'
  }
  use {
    "AckslD/nvim-neoclip.lua",
    commit = 'e112a0b'
  }
  -- Git plugin
  use 'sindrets/diffview.nvim'
  -- LSP & programming
  use 'neovim/nvim-lspconfig' -- Huge repo of lsp configs
  use 'scalameta/nvim-metals' -- Scala plugin (syntax, lsp, code actions and more)
  use {
    'posva/vim-vue', -- Vue syntax highlight (this plugin may be a bit obslotete)
    commit = 'c424294'
  }
  use {
    'bfrg/vim-cpp-modern', -- C++ syntax highlight
    commit = '0f0529b'
  }
  use {
    'chr4/nginx.vim', -- Nginx syntax highlight
    commit = '9969445'
  }
  -- Prettier
  use  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'svelte', 'yaml', 'html'}
  }
  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  -- Auto brackets
  use 'jiangmiao/auto-pairs'
  -- Snippets
  use  {
    'dcampos/nvim-snippy',
    commit = '834820d'
  }
  use {
    'dcampos/cmp-snippy', -- Insert snippets in autocompletion
    commit = '9af1635'
  }
  -- Leap
  use {
    'ggandor/leap.nvim',
    requires = {"tpope/vim-repeat"}
  }
  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'stevearc/aerial.nvim',
    commit = "e2b6cd0"
  }
end)
