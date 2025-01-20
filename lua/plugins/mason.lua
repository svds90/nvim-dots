require("mason").setup {
  ui = {
    border = "single",
    height = 0.7,
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}
