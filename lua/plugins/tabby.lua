local theme = {
  fill = { bg = "#1e1e26" },
  head = "TabLine",
  current_tab = { bg = "#874917", fg = "#c2c2c2", style = "bold" },
  current_tab_sep = { bg = "#874917" },
  tab = { bg = "#343442", fg = "#76798a" },
  win = {
    active = { bg = "#874917", fg = "#c2c2c2", style = "bold" }, -- Активное окно
    inactive = { bg = "#343442", fg = "#76798a" }, -- Неактивное окно
  },
  tail = "TabLine",
}

-- Функция для получения LSP-серверов для текущего буфера
local function get_lsp_clients()
  local clients = vim.lsp.get_active_clients { bufnr = vim.api.nvim_get_current_buf() }
  if #clients == 0 then
    return ""
  end
  local client_names = {}
  for _, client in ipairs(clients) do
    table.insert(client_names, client.name)
  end
  return "" .. table.concat(client_names, ", ") .. " "
end

-- Функция для индикатора изменения файла
local function get_modified_status()
  return vim.bo.modified and " ✓" or " ✗"
end

-- Настройка tabby
require("tabby").setup {
  line = function(line)
    return {
      {
        { "  ", hl = theme.head },
        line.sep("", theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        local sep_hl = tab.is_current() and theme.current_tab_sep or hl
        return {
          line.sep("", sep_hl, theme.fill),
          tab.is_current() and "" or "󰆣",
          tab.name(),
          tab.close_btn "",
          line.sep("", sep_hl, theme.fill),
          hl = hl,
          margin = " ",
        }
      end),
      line.spacer(),
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        local win_hl = win.is_current() and theme.win.active or theme.win.inactive
        return {
          line.sep("", win_hl, theme.fill),
          win.is_current() and "" or "󰆣",
          win.buf_name(),
          line.sep("", win_hl, theme.fill),
          hl = win_hl,
          margin = " ",
        }
      end),
      {
        line.sep("", theme.tail, theme.fill),
        { get_modified_status(), hl = theme.tail }, -- Индикатор изменения файла
        { " " .. get_lsp_clients(), hl = theme.tail }, -- LSP-серверы для текущего буфера
      },
      hl = theme.fill,
    }
  end,
}

-- Автоматическое обновление tabby при изменении активного буфера
vim.api.nvim_create_autocmd({ "BufEnter", "LspAttach", "LspDetach" }, {
  callback = function()
    -- Принудительно обновляем tabby
    require("tabby").update()
  end,
})
