-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Buffer management
map("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete buffer" })

-- Window navigation (splits)
map("n", "<leader>sh", "<C-w>h", { noremap = true, silent = true, desc = "Window left" })
map("n", "<leader>sj", "<C-w>j", { noremap = true, silent = true, desc = "Window down" })
map("n", "<leader>sk", "<C-w>k", { noremap = true, silent = true, desc = "Window up" })
map("n", "<leader>sl", "<C-w>l", { noremap = true, silent = true, desc = "Window right" })

-- Quick save
map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Copy to system clipboard (if not already mapped)
map({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, silent = true, desc = "Copy to system clipboard" })

-- Paste from system clipboard
map("n", "<leader>p", [["+p]], { noremap = true, silent = true, desc = "Paste from system clipboard" })

vim.keymap.set("n", "<leader>cc", function()
  local file1 = vim.fn.expand("%")

  local project_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if project_root == "" then
    project_root = vim.fn.getcwd()
  end

  require("telescope.builtin").find_files({
    prompt_title = "Compare with...",
    cwd = project_root,
    hidden = true,
    follow = true,
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local file2 = action_state.get_selected_entry().path
        actions.close(prompt_bufnr)
        require("user.utils").meld_diff(file1, file2)
      end)
      return true
    end,
  })
end, { desc = "Compare with" })
