-- Requires pgformatter package (https://github.com/darold/pgFormatter)
-- Formats SQL
vim.cmd([[au BufWritePre *.sql %!pg_format]])
