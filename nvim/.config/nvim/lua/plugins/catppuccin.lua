return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        -- Choose your flavor: latte, frappe, macchiato, mocha
        require("catppuccin").setup({flavour = "macchiato"})
        -- Activate the colorscheme
        vim.cmd("colorscheme catppuccin")
    end
}
