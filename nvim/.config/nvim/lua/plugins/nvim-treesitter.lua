return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local filetypes = {
      "bash",
      "css",
      "dockerfile",
      "html",
      "javascript",
      "jsx",
      "kdl",
      "lua",
      "markdown",
      "python",
      "scss",
      "toml",
      "tsx",
      "typescript",
      "yaml",
      "zsh",
    }
    require("nvim-treesitter").install(filetypes)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
