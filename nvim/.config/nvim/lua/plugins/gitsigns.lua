return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "hunk" })

        -- Actions
        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "stage_hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "reset_hunk" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "preview_hunk" })
        map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "preview_hunk_inline" })

        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "stage_hunk" })
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "reset_hunk" })

        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "stage_buffer" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "reset_buffer" })

        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "blame_line" })
        map("n", "<leader>hB", gitsigns.blame, { desc = "blame" })

        map("n", "<leader>hd", gitsigns.diffthis, { desc = "diffthis" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis("~")
        end, { desc = "diffthis~" })

        map("n", "<leader>hq", gitsigns.setqflist, { desc = "setqflist" })
        map("n", "<leader>hQ", function()
          gitsigns.setqflist("all")
        end, { desc = "setqflist (all)" })

        -- Toggles
        map("n", "<leader>htb", gitsigns.toggle_current_line_blame, { desc = "toggle_current_line_blame" })
        map("n", "<leader>htw", gitsigns.toggle_word_diff, { desc = "toggle_word_diff" })

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "select_hunk" })
      end,
    })
  end,
}
