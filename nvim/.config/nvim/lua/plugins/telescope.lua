-- TODO: Set up telescope file browser

return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim", -- optional but recommended
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope_config = require("telescope.config")

    local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    require("telescope").setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })

    local builtin = require("telescope.builtin")

    -- first class pickers
    vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "find_files" })
    vim.keymap.set("n", "<leader>*", builtin.grep_string, { desc = "grep_string" })
    vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "live_grep" })
    vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "buffers" })
    vim.keymap.set("n", "<leader>j", builtin.jumplist, { desc = "jumplist" })
    vim.keymap.set("n", "<leader>'", builtin.resume, { desc = "resume" })
    vim.keymap.set("n", "<leader>g", builtin.git_status, { desc = "git_status" })

    -- lsp pickers
    vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, { desc = "lsp_document_symbols" })
    vim.keymap.set("n", "<leader>S", builtin.lsp_workspace_symbols, { desc = "lsp_workspace_symbols" })
    vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "diagnostics" })
    vim.keymap.set("n", "grr", builtin.lsp_references, { desc = "lsp_references" })
    vim.keymap.set("n", "grd", builtin.lsp_definitions, { desc = "lsp_definitions" })
    vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "lsp_definitions" }) -- shortcut

    -- other pickers
    vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "git_files" })
    vim.keymap.set("n", "<leader>po", builtin.oldfiles, { desc = "oldfiles" })
    vim.keymap.set("n", "<leader>pc", builtin.commands, { desc = "commands" })
    vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "help_tags" })
    vim.keymap.set("n", "<leader>pq", builtin.quickfix, { desc = "quickfix" })
    vim.keymap.set("n", "<leader>pp", builtin.pickers, { desc = "pickers" })
  end,
}
