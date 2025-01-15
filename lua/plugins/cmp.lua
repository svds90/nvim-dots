local cmp = require "cmp"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local formatting = {

  fields = { "menu", "abbr", "kind" },
  format = function(entry, item)
    local menu_icon = {
      nvim_lsp = " ", --   󱡶
      luasnip = " ",
      buffer = " ",
      path = " ",
      nvim_lsp_signature_help = "󱡶 ",
      -- treesitter = "󰐅 ",
      -- codeium = "󱜚 ",
    }
    item.menu = menu_icon[entry.source.name]
    return item
  end,
}

-- Источники для автодополнения
local sources = {
  { name = "nvim_lsp" },
  { name = "buffer" },
  { name = "nvim_lua" },
  { name = "path" },
  { name = "nvim_lsp_signature_help" },
  -- { name = "codeium", keyword_length = 3, max_item_count = 10 },
  -- { name = "treesitter", keyword_length = 3, max_item_count = 10 },
}

-- Настройка клавиш
local mapping = {
  ["<Up>"] = cmp.mapping.select_prev_item(),
  ["<Down>"] = cmp.mapping.select_next_item(),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.close(),
  ["<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      fallback()
    end
  end,
  ["<S-Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end,
  ["<CR>"] = cmp.mapping {
    i = function(fallback)
      if cmp.visible() and cmp.get_active_entry() then
        cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
      else
        fallback()
      end
    end,
    s = cmp.mapping.confirm { select = true },
    c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
  },
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Возвращаем финальную конфигурацию
return {
  formatting = formatting,
  sources = sources,
  mapping = mapping,
  window = {
    completion = {
      border = "none",
      scrollbar = true,
      winhighlight = "Normal:MyCompletion",
    },
    documentation = {
      border = "none",
      scrollbar = true,
      winhighlight = "Normal:MyDocumentation",
    },
  },
  completion = {
    completeopt = "menu,menuone,noselect",
  },
  experimental = {
    ghost_text = false,
  },
  keyword_length = 2,
  preselect = cmp.PreselectMode.None,
}
