require("mason").setup {
  ui = {
    border = "single",
    backdrop = 100,
    height = 0.7,
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}
