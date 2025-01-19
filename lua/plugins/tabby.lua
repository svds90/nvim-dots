local theme = {
  fill = "TabLineFill",
  head = "TabLine",
  current_tab = { bg = "#874917", fg = "#e3dfe6", style = "bold" },
  current_tab_sep = { bg = "#874917" },
  tab = { bg = "#343442", fg = "#76798a" },
  win = {
    active = { bg = "#874917", fg = "#e3dfe6", style = "bold" }, -- Активное окно
    inactive = { bg = "#343442", fg = "#76798a" }, -- Неактивное окно
  },
  tail = "TabLine",
}

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
        { "  ", hl = theme.tail },
      },
      hl = theme.fill,
    }
  end,
}
