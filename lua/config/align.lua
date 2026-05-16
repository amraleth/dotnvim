return {
    {
        "echasnovski/mini.align",
        keys = {
            { "<leader>aa", mode = { "n", "x" }, desc = "Align (interactive)" },
            { "<leader>aA", mode = { "n", "x" }, desc = "Align with preview" },
        },
        opts = {
            mappings = {
                start = "<leader>aa",
                start_with_preview = "<leader>aA",
            },
        },
    },
}
