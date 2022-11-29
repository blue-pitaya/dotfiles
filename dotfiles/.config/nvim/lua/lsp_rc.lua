require('utils')

-- Automatic formatting
vim.cmd([[au BufWritePre *.scala lua vim.lsp.buf.format()]])

-- Scala
metals_config = require("metals").bare_config()
metals_config.settings = {
  serverVersion = '0.11.2', -- newer versions dont work
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "akka.stream.javadsl", "akka.http.javadsl" },
}

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end


vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])

-- Diagnostics plugin
-- https://github.com/folke/trouble.nvim
require("trouble").setup{
  height = 5, -- height of the trouble list when position is top or bottom
  padding = false, -- extra new line on top of the list
}
map("n", "<Leader><Leader>", "<cmd>TroubleToggle<CR>")

-- Disable inline diagnostics (i have trouble plugin now so sajonara kompanieros)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        update_in_insert = false,
        underline = true,
        -- signs = false,
    }
)

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}


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
