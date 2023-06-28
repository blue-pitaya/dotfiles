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
        globals = {'vim', 'vim.api'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
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

require'lspconfig'.bashls.setup{}
require'lspconfig'.jedi_language_server.setup{}

-- required: yarn global add yaml-language-server
-- require('lspconfig').yamlls.setup{}

-- PHP LSP, where did i go wrong?
-- require'lspconfig'.phan.setup{}
