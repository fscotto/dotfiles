-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Resume last Telescope search
-- map(
--   "n",
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume Telescope" }
-- )

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
