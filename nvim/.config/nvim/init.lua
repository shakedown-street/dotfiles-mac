vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes:2"
vim.opt.guicursor = ""

-- NOTE: These settings get overridden by guess-indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

require("config.lazy")

-- diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "diagnostic.open_float" })
vim.diagnostic.config({
  signs = {
    priority = 5,
  },
})

-- init treesitter
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "kdl",
    "lua",
    "markdown",
    "prisma",
    "python",
    "scss",
    "sh",
    "toml",
    "typescript",
    "typescriptreact",
    "yaml",
    "zsh",
  },
  callback = function()
    vim.treesitter.start()
  end,
})

-- do not deselect after indenting a visual block
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

-- clear search highlight on escape key
vim.keymap.set("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd("nohlsearch")
    return ""
  end
  return "<Esc>"
end, { expr = true })

vim.keymap.set("n", "<leader>q", function()
  vim.cmd("bd")
end, { desc = "bdelete" })
