return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    bash = { "shfmt", "shellcheck" },
    sh = { "shfmt", "shellcheck" },
    zsh = { "shfmt", "shellcheck" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
    black = {
      prepend_args = { "--line-length", "100" },
    },
  },
}
