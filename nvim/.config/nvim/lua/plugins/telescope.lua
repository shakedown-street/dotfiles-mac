return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim", -- optional but recommended
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
    })

    local builtin = require("telescope.builtin")

    -- file pickers
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find_files" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "git_files" })
    vim.keymap.set("n", "<leader>f*", builtin.grep_string, { desc = "grep_string" })
    vim.keymap.set("n", "<leader>f/", builtin.live_grep, { desc = "live_grep" })

    -- vim pickers
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "oldfiles" })
    vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "commands" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help_tags" })
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "quickfix" })
    vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "jumplist" })
    vim.keymap.set("n", "<leader>f'", builtin.resume, { desc = "resume" })
    vim.keymap.set("n", "<leader>fp", builtin.pickers, { desc = "pickers" })

    -- lsp pickers
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "lsp_references" })
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "lsp_document_symbols" })
    vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "lsp_workspace_symbols" })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "lsp_definitions" })
    vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "diagnostics" })
  end,
}
