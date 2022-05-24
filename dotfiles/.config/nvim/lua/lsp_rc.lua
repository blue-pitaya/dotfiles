require('utils')

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "J", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<Leader>l", "<cmd>lua vim.lsp.codelens.run()<CR>")
map("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("i", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

-- Automatic formatting
vim.cmd([[au BufWritePre *.scala lua vim.lsp.buf.formatting()]])

-- Scala
metals_config = require("metals").bare_config()
metals_config.settings = {
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
        -- signs = false,
    }
)

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat ctermbg=235]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder ctermfg=239]]

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

-- Typescrpt
-- requires: yarn global add typescript typescript-language-server
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
require'lspconfig'.tsserver.setup{ handlers=handlers }
-- requires: yarn global add vls
require'lspconfig'.vuels.setup { }

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
