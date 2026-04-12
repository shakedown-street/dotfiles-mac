return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.cursorword").setup()
    local files = require("mini.files")
    files.setup({
      windows = {
        max_number = 3,
      },
    })
    require("mini.icons").setup()
    require("mini.jump").setup()
    require("mini.pairs").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()
    require("mini.tabline").setup()

    vim.keymap.set("n", "<leader>e", function()
      files.open()
    end, { desc = "MiniFiles.open" })

    vim.keymap.set("n", "<leader>E", function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      files.open(buf_name ~= "" and buf_name)
    end, { desc = "MiniFiles.open at buffer" })
  end,
}
