require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "horizon",
    -- component_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
    component_separators = { left = "-", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
  },
  sections = {
    lualine_a = { "mode" },

    lualine_b = { "branch", "diff" },
    -- lualine_c = { "filename" },
    lualine_c = {
      {
        function()
          local clients = vim.lsp.buf_get_clients() -- Получаем активные LSP-серверы
          if next(clients) == nil then
            return "" -- Если серверов нет, возвращаем пустую строку
          end

          local client_names = {}
          for _, client in pairs(clients) do
            table.insert(client_names, client.name) -- Собираем имена серверов
          end

          return "  " .. table.concat(client_names, ", ") -- Отображаем имена серверов
        end,
        -- color = { fg = "#DCD7BA" }, -- Цвет текста
      },
      "diagnostics",
    },
    lualine_x = { "filename" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "lazy", "mason" },
}
