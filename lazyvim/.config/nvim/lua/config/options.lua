-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

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

-- Enable true color support
opt.termguicolors = true

-- Enable system clipboard
opt.clipboard = "unnamedplus"

-- Indentation
opt.expandtab = false
opt.shiftwidth = 8
opt.tabstop = 8
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

-- Fold method
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99 -- open all folds by default

-- Show file name and modified flag in the window bar
opt.winbar = "%=%m %f"
