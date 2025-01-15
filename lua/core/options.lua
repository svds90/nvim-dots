-- "Inspect" fix
vim.hl = vim.highlight

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.pumheight = 15
-- vim.wo.statuscolumn = "%s %l %r "

-- Indent Settings
-- vim.opt.expandtab = true
-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.smartindent = true

-- Установка отступов в 2 пробела для Lua
vim.cmd [[
  autocmd FileType lua setlocal tabstop=2 shiftwidth=2 expandtab
]]
