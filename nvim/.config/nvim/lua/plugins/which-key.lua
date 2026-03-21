return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- keys = {
  --   {
  --     "<leader>?",
  --     function()
  --       require("which-key").show({ global = false })
  --     end,
  --     desc = "Buffer Local Keymaps (which-key)",
  --   },
  -- },
  config = function()
    local wk = require("which-key")

    wk.setup({
      preset = "helix",
    })

    wk.add({
      { "<leader>g", group = "Gitsigns" },
      { "<leader>p", group = "Telescope" },
      { "<leader>t", group = "Toggle" },
    })
  end,
}
