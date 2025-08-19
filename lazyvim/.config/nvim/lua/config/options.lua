-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Enable mouse in all modes
opt.mouse = "a"

-- Better searching
opt.ignorecase = true
opt.smartcase = true

-- Highlight current line
opt.cursorline = true
opt.cursorlineopt = "number"

-- Enable true color support
opt.termguicolors = true

-- Enable system clipboard
opt.clipboard = "unnamedplus"

-- Indentation
-- opt.softtabstop = 8
-- opt.shiftwidth = 8
-- opt.tabstop = 8
opt.expandtab = true
opt.smartindent = true

-- Split behavior
opt.splitright = true
opt.splitbelow = true

-- Enable undo file to persist undo history
opt.undofile = true

-- Set upbar similar to statusline (optional)
opt.statusline = "%f %m %r %=%-14.(%l,%c%V%) %P"

-- Persistent signcolumn to avoid text shifting
opt.signcolumn = "yes"

-- Show file name and modified flag in the window bar
opt.winbar = "%=%m %f"

-- Backup files
opt.swapfile = false
opt.backup = false
