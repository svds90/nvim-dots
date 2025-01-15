vim.g.mapleader = " "

-- NEOTREE
local function toggle_neo_tree()
  local current_buf = vim.api.nvim_get_current_buf()

  local is_neo_tree = vim.bo[current_buf].filetype == "neo-tree"

  if is_neo_tree then
    vim.cmd "Neotree close"
  else
    local neo_tree_buf = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].filetype == "neo-tree" then
        neo_tree_buf = buf
        break
      end
    end

    if neo_tree_buf then
      vim.cmd "Neotree focus"
    else
      vim.cmd "Neotree toggle"
    end
  end
end

vim.keymap.set("n", "<Leader>e", toggle_neo_tree, { desc = "Toggle NeoTree" })

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
