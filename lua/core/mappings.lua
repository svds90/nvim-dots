vim.g.mapleader = " "

-- VIM
vim.keymap.set("n", "<leader>pp", ":!python %<CR>", { noremap = true, silent = true, desc = "Run current Python file" })

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
vim.keymap.set("n", "<leader>fd", function() -- extension frecency
  require("telescope").extensions.frecency.frecency {}
end, { desc = "Telescope frecency (dropdown, no preview)" })

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

-- TERMINAL
vim.keymap.set("t", "<A-q>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal insert mode" })
vim.keymap.set(
  "n",
  "<leader>tt",
  ":tab term<CR>",
  { noremap = true, silent = true, desc = "Exit terminal insert mode" }
)

local function close_all_terminal_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name:match "^term://" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

vim.keymap.set(
  "n",
  "<leader>tr",
  close_all_terminal_buffers,
  { noremap = true, silent = true, desc = "Close all terminal buffers" }
)
