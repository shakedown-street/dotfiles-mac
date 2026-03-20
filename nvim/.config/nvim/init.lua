vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic open float" })

-- disable netrw completely
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- only run if no files were passed on the command line
    if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
      require("telescope.builtin").find_files()
    end
  end,
})
