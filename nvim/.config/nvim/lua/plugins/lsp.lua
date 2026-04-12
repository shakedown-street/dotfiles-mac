return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "bashls",
          "cssls",
          "docker_language_server",
          "eslint",
          "gopls",
          "html",
          "lua_ls",
          "prismals",
          "pyright",
          "remark_ls",
          "stylua",
          "tailwindcss",
          "ts_ls",
        },
      },
    },
  },
  config = function()
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
          },
        },
      },
    })
  end,
}
