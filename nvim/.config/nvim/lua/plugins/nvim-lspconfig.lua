return {
	"neovim/nvim-lspconfig",
	dependencies = { "mason-lspconfig.nvim" },
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		for _, server_name in ipairs(require("mason-lspconfig").get_installed_servers()) do
			vim.lsp.config(server_name, {
				capabilities = capabilities,
			})
			vim.lsp.enable(server_name)
		end
	end,
}
