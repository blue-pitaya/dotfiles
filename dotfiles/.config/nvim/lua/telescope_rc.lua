local lga_actions = require("telescope-live-grep-args.actions")

require('telescope').setup{
  defaults = {
    layout_config = {
      horizontal = {
        height = { padding = 1 },
        width = { padding = 18 },
        prompt_position = "top",
      },
      vertical = {
        height = { padding = 1 },
        width = { padding = 18 },
        prompt_position = "top",
      },
    },
    wrap_results = true,
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous"
      }
    },
    file_ignore_patterns = { "project/target", "project/project", "target" },
    path_display = {"smart"},
    borderchars =  { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
    sorting_strategy = "ascending"
  },
  pickers = {
    find_files = {
    },
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-l>"] = lga_actions.quote_prompt(),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}

require("telescope").load_extension("live_grep_args")
require('neoclip').setup({
  history = 1000,
  enable_persistent_history = false,
  length_limit = 1048576,
  continuous_sync = false,
  filter = nil,
  preview = true,
  prompt = nil,
  default_register = '"',
  default_register_macros = 'q',
  enable_macro_history = true,
  content_spec_column = true,
  on_select = {
    move_to_front = false,
  },
  on_paste = {
    set_reg = false,
    move_to_front = false,
  },
  on_replay = {
    set_reg = false,
    move_to_front = false,
  },
  keys = {
    telescope = {
      i = {
        select = '<c-y>',
        paste = '<cr>',
        paste_behind = {},
        replay = '<c-q>',  -- replay a macro
        delete = '<c-d>',
      },
      n = {
        --- It is possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        select = {'y', 'Y'},
        paste = '<cr>',
        paste_behind = 'P',
        replay = 'q',
        delete = 'd',
        custom = {},
      },
    },
  },
})
require("telescope").load_extension("neoclip")

-- Magic telescope border ;)
vim.cmd([[au InsertEnter * hi! TelescopePromptBorder guifg=#00ffd7]])
vim.cmd([[au InsertLeave * hi! link TelescopePromptBorder TelescopeBorder]])
