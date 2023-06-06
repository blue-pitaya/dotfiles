-- Automatic formatting
vim.cmd([[au BufWritePre *.scala lua vim.lsp.buf.format()]])
vim.cmd([[au BufWritePre *.sbt lua vim.lsp.buf.format()]])

-- Scala
---@diagnostic disable-next-line: lowercase-global
metals_config = require("metals").bare_config()
metals_config.settings = {
  serverVersion = '0.11.11',
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "akka.stream.javadsl", "akka.http.javadsl" },
  bloopSbtAlreadyInstalled = true,
}

metals_config.on_attach = function()
  require("metals").setup_dap()
end


vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])

-- Disable inline diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        update_in_insert = false,
        underline = true,
    }
)

-- NOTE (for neotree): this is changed from v1.x, which used the old style of highlight groups
-- in the form "LspDiagnosticsSignWarning"
-- Set diagnostic signs
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Custom border
local border = {
      {"┏", "FloatBorder"},
      {"━", "FloatBorder"},
      {"┓", "FloatBorder"},
      {"┃", "FloatBorder"},
      {"┛", "FloatBorder"},
      {"━", "FloatBorder"},
      {"┗", "FloatBorder"},
      {"┃", "FloatBorder"},
}
vim.lsp.with(vim.lsp.handlers.hover, {border = border})
vim.lsp.with(vim.lsp.handlers.signature_help, {border = border })


-- Typescrpt and Vue
-- require: yarn global add @volar/vue-language-server
-- require: yarn global add typescript
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar

-- Volar config, you should specify path to tsserver yourself
require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  init_options = {
    typescript = {
      tsdk = os.getenv("HOME") .. '/.config/yarn/global/node_modules/typescript/lib'
    }
  }
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


-- Dockerfile
-- require: npm install -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup{}


-- Lua
-- require lua-language-server, on arch: sudo pacman -S lua-language-server
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require'lspconfig'.rust_analyzer.setup{
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

-- Better select (TODO: move it to some better place)

local function get_prompt_text(prompt, default_prompt)
  local prompt_text = prompt or default_prompt
  if prompt_text:sub(-1) == ":" then
    prompt_text = "[" .. prompt_text:sub(1, -2) .. "]"
  end
  return prompt_text
end

local function override_ui_select()
  local UISelect = Menu:extend("UISelect")

  function UISelect:init(items, opts, on_done)
    local border_top_text = get_prompt_text(opts.prompt, "[Select Item]")
    local kind = opts.kind or "unknown"
    local format_item = opts.format_item or function(item)
      return tostring(item.__raw_item or item)
    end

    local popup_options = {
      relative = "editor",
      position = "50%",
      border = {
        style = "rounded",
        text = {
          top = border_top_text,
          top_align = "left",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
      },
      zindex = 999,
    }

    if kind == "codeaction" then
      -- change position for codeaction selection
      popup_options.relative = "cursor"
      popup_options.position = {
        row = 1,
        col = 0,
      }
    end

    local max_width = popup_options.relative == "editor" and vim.o.columns - 4 or vim.api.nvim_win_get_width(0) - 4
    local max_height = popup_options.relative == "editor" and math.floor(vim.o.lines * 80 / 100)
      or vim.api.nvim_win_get_height(0)

    local menu_items = {}
    for index, item in ipairs(items) do
      if type(item) ~= "table" then
        item = { __raw_item = item }
      end
      item.index = index
      local item_text = string.sub(format_item(item), 0, max_width)
      menu_items[index] = Menu.item(item_text, item)
    end

    local menu_options = {
      min_width = vim.api.nvim_strwidth(border_top_text),
      max_width = max_width,
      max_height = max_height,
      lines = menu_items,
      on_close = function()
        on_done(nil, nil)
      end,
      on_submit = function(item)
        on_done(item.__raw_item or item, item.index)
      end,
    }

    UISelect.super.init(self, popup_options, menu_options)

    -- cancel operation if cursor leaves select
    self:on(event.BufLeave, function()
      on_done(nil, nil)
    end, { once = true })
  end

  local select_ui = nil

  vim.ui.select = function(items, opts, on_choice)
    assert(type(on_choice) == "function", "missing on_choice function")

    if select_ui then
      -- ensure single ui.select operation
      vim.api.nvim_err_writeln("busy: another select is pending!")
      return
    end

    select_ui = UISelect(items, opts, function(item, index)
      if select_ui then
        -- if it's still mounted, unmount it
        select_ui:unmount()
      end
      -- pass the select value
      on_choice(item, index)
      -- indicate the operation is done
      select_ui = nil
    end)

    select_ui:mount()
  end
end

override_ui_select()

require'lspconfig'.bashls.setup{}

-- required: yarn global add yaml-language-server
-- require('lspconfig').yamlls.setup{}
