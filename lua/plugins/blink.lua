local blink = require "blink.cmp"

blink.setup {
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },

  completion = {
    list = {
      selection = {
        preselect = false,
      },
    },
    menu = {
      max_height = 5,
      auto_show = true,
      draw = {
        -- treesitter = { "lsp" },
        columns = {
          { "kind_icon", "label", "source_name", gap = 1 },
        },
      },
    },
    ghost_text = {
      enabled = false,
    },
    documentation = {
      auto_show = false,
      auto_show_delay_ms = 500,
    },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    min_keyword_length = 2,
  },
}
