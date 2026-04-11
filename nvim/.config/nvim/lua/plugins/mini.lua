return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.icons").setup()
    require("mini.files").setup({
      options = {
        use_as_default_explorer = false,
      },
    })
    require("mini.jump").setup()
    require("mini.pairs").setup()
    require("mini.statusline").setup()
    require("mini.tabline").setup()

    local function toggleMiniFiles(cwd)
      local MiniFiles = require("mini.files")
      if not MiniFiles.close() then
        local buf_name = vim.api.nvim_buf_get_name(0)
        if not cwd then
          MiniFiles.open(buf_name ~= "" and buf_name)
        else
          MiniFiles.open()
        end
      end
    end

    vim.keymap.set("n", "<leader>e", function()
      toggleMiniFiles(true)
    end, { desc = "MiniFiles.open cwd" })

    vim.keymap.set("n", "<leader>E", function()
      toggleMiniFiles(false)
    end, { desc = "MiniFiles.open buffer" })
  end,
}
