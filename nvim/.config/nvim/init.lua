vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.signcolumn = "yes:2"

vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- NOTE: Can be disabled if bufferline is removed
vim.opt.termguicolors = true

-- disable netrw completely
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NOTE: Disabled in favor of guess-indent

-- vim.opt.expandtab = true
-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.softtabstop = 2
-- vim.opt.smartindent = true
-- vim.opt.autoindent = true

require("config.lazy")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "diagnostic.open_float" })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- only run if no files were passed on the command line
    if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
      require("telescope.builtin").find_files()
    end
  end,
})
