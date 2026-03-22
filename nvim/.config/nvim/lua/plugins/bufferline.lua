-- TODO: Create keybinds for cyling, sorting, pinning, and closing

return {
  "akinsho/bufferline.nvim",
  enabled = false,
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
      },
    })
  end,
}
