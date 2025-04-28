return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
        flavour = "mocha",
        background = {
            dark = "mocha",
        },
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            cmp = true,
            nvimtree = true,
            treesitter = true,
            mason = true,
        },

    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end
}
