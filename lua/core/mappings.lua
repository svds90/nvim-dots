vim.g.mapleader = " "

-- FUCK TABS FUCK SPACES

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
