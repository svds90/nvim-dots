return {
  defaults = {
    border = true,
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    sorting_strategy = "ascending",
    -- winblend = 10,
    layout_config = {
      width = 0.9,
      height = 0.9,
      prompt_position = "top",
      horizontal = {
        preview_width = 0.6, -- Ширина предпросмотра (60% от ширины экрана)
      },
      vertical = {
        preview_height = 0.6, -- Высота предпросмотра (60% от высоты экрана)
      },
    },
  },
  pickers = {
    -- Дополнительные настройки для конкретных пикеров...
  },
  extensions = {
    frecency = {
      layout_config = {
        width = 0.5,
        height = 0.5,
      },
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      theme = "dropdown", -- Применяем тему dropdown
      previewer = false, -- Отключаем превью
    },
  },
}
