-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Buffer management
map("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete buffer" })

-- Copy to system clipboard (if not already mapped)
map({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, silent = true, desc = "Copy to system clipboard" })

-- Paste from system clipboard
map("n", "<leader>p", [["+p]], { noremap = true, silent = true, desc = "Paste from system clipboard" })

-- Markdown menu
map("n", "<leader>M", [["+M]], { noremap = true, silent = true, desc = "Markdown" })
