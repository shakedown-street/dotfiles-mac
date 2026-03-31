vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes:2"

-- NOTE: These settings get overridden by guess-indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

require("config.lazy")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "diagnostic.open_float" })
