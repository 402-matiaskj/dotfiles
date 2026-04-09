-- Settings that affect the buffer

vim.opt.encoding = "utf-8"
vim.opt.number = true

--- Indentation
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--- Splitting
vim.opt.splitbelow = true -- new horizontal window spawns below
vim.opt.splitright = true -- new vertical window spawns to the right

vim.opt.wrapscan = false
vim.opt.ignorecase = true
vim.opt.textwidth = 80
vim.opt.signcolumn = "yes"

vim.o.laststatus = 3 -- make it so we draw a line between horizontal windows

-- Scroll earlier
vim.o.scrolloff = 8

-- Use UndoDir
-- this allows us to keep the history of a buffer even after closing vim
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

-- sets the border for most of the window popups
vim.o.winborder = "double"
