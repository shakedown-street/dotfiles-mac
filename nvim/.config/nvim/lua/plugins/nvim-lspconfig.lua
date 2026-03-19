return {
    "neovim/nvim-lspconfig",
    dependencies = {"mason-lspconfig.nvim"},
    config = function()
        local lspconfig = require("lspconfig")

        -- capabilities (optional but recommended if you add cmp later)
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- mason-lspconfig hook
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({capabilities = capabilities})
            end

            -- Example override for lua_ls
            -- ["lua_ls"] = function()
            --   lspconfig.lua_ls.setup({
            --     capabilities = capabilities,
            --     settings = {
            --       Lua = {
            --         diagnostics = {
            --           globals = { "vim" },
            --         },
            --       },
            --     },
            --   })
            -- end,
        })
    end
}
