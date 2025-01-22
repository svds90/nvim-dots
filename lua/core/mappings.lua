vim.g.mapleader = " "

-- NVIMTREE
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- TELESCOPE
local function telescope_builtin(cmd)
  return function()
    require("telescope.builtin")[cmd]()
  end
end

vim.keymap.set("n", "<leader>ff", telescope_builtin "find_files", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope_builtin "live_grep", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope_builtin "buffers", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope_builtin "help_tags", { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fd", ":Telescope frecency<CR>", { desc = "Telescope frecency" })

-- DIAGNOSTICS
vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.open_float {
    scope = "line",
    border = "single",
  }
end, { desc = "Show all diagnostics for the current line" })

vim.keymap.set(
  "n",
  "<leader>da",
  ":lua vim.diagnostic.setqflist()<CR>",
  { desc = "Show all diagnostics for the current file" }
)
