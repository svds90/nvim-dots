-- "Inspect" fix
vim.hl = vim.highlight

-- VIM
vim.opt.hidden = true
vim.opt.undofile = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.pumheight = 15
vim.opt.termguicolors = true
vim.opt.startofline = false
vim.opt.laststatus = 0
vim.wo.signcolumn = "yes"
vim.o.scrolloff = 3
vim.o.virtualedit = "onemore"

-- add an epty space
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  callback = function()
    if vim.bo.buftype ~= "" then
      return
    end

    local windowLines = vim.api.nvim_win_get_height(0)
    local currLine = vim.fn.line "."
    local lastLine = vim.fn.line "$"

    local bottom = 0
    if windowLines > lastLine then
      bottom = windowLines
    else
      bottom = lastLine
    end

    local marginBottom = currLine + vim.o.scrolloff - bottom
    if marginBottom == 0 then
      vim.api.nvim_input "zb"
    elseif marginBottom > 0 then
      vim.api.nvim_input "zb"
      vim.api.nvim_input(marginBottom .. "<C-E>")
    end
  end,
})

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

-- TERMINAL
vim.api.nvim_create_autocmd("BufEnter", { -- autoinsert change tab
  pattern = "term://*",
  callback = function()
    vim.cmd "startinsert"
  end,
})

vim.api.nvim_create_autocmd("TermOpen", { -- autoinset open term tab
  pattern = "*",
  callback = function()
    vim.cmd "startinsert"
  end,
})

-- NVIM TREE
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match "NvimTree_" ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      for _, w in ipairs(invalid_win) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})
