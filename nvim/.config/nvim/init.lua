vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:2"
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 0

-- NOTE: Status is shown by lualine
vim.opt.showmode = false

-- NOTE: These settings get overridden by guess-indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

require("config.lazy")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "diagnostic.open_float" })

-- Keymaps to open netrw in a left split
vim.keymap.set("n", "<leader>fe", function()
  vim.cmd("Lexplore " .. vim.fn.getcwd(-1, -1))
end, { desc = "netrw (cwd)" })
vim.keymap.set("n", "<leader>fE", function()
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("Lexplore " .. dir)
end, { desc = "netrw (buffer)" })

-- Open telescope whenever a file or dir isn't passed in args
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("telescope.builtin").find_files()
    end
  end,
})

-- Enable treesitter
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "<filetype>" },
  callback = function(args)
    -- enables syntax highlighting and other treesitter features
    vim.treesitter.start()

    -- enables experimental treesitter indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
