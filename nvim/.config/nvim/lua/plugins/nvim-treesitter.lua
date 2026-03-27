return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "bash",
      "css",
      "dockerfile",
      "html",
      "javascript",
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
    require("nvim-treesitter").install(parsers)
  end,
}
