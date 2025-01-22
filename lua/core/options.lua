-- "Inspect" fix
vim.hl = vim.highlight

-- VIM
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.pumheight = 15
vim.opt.termguicolors = true
vim.opt.startofline = false
vim.opt.laststatus = 0
vim.wo.signcolumn = "yes"

-- TABBY
vim.o.showtabline = 2

-- LUA TWO SPACES
vim.cmd [[
  autocmd FileType lua setlocal tabstop=2 shiftwidth=2 expandtab
]]

-- DIAGNOSTIC SYMBOLS
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  virtual_text = {
    prefix = "■ ", -- '●', '▎', 'x'
  },
}
