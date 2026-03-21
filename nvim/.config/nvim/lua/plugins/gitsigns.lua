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
        map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "stage_hunk" })
        map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "reset_hunk" })
        map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "preview_hunk" })
        map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "preview_hunk_inline" })

        map("v", "<leader>gs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "stage_hunk" })
        map("v", "<leader>gr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "reset_hunk" })

        map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "stage_buffer" })
        map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "reset_buffer" })

        map("n", "<leader>gb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "blame_line" })
        map("n", "<leader>gB", gitsigns.blame, { desc = "blame" })

        map("n", "<leader>gd", gitsigns.diffthis, { desc = "diffthis" })
        map("n", "<leader>gD", function()
          gitsigns.diffthis("~")
        end, { desc = "diffthis~" })

        map("n", "<leader>gq", gitsigns.setqflist, { desc = "setqflist" })
        map("n", "<leader>gQ", function()
          gitsigns.setqflist("all")
        end, { desc = "setqflist (all)" })

        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "toggle_current_line_blame" })
        map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "toggle_word_diff" })

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "select_hunk" })
      end,
    })
  end,
}
