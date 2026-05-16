return {
    {
        "miikanissi/modus-themes.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "auto",
            variants = "default",
            transparent = false,
            dim_inactive = false,

            styles = {
                comments  = { italic = true },
                keywords  = { bold   = true },
                functions = {},
                variables = {},
            },

            on_highlights = function(highlights, colors)
            end,
        },
        config = function(_, opts)
            require("modus-themes").setup(opts)
            vim.o.background = "dark"
            vim.cmd.colorscheme("modus_vivendi")
        end,
    },
}
