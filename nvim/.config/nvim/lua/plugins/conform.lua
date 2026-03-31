return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
      format_on_save = {
        lsp_format = "fallback",
      },
    })
  end,
}
