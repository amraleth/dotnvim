return {
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<CR>",        desc = "Neogit" },
            { "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Neogit commit" },
            { "<leader>gp", "<cmd>Neogit pull<CR>",   desc = "Neogit pull" },
            { "<leader>gP", "<cmd>Neogit push<CR>",   desc = "Neogit push" },
            { "<leader>gl", "<cmd>Neogit log<CR>",    desc = "Neogit log" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            kind = "tab",
            integrations = {
                diffview = true,
                telescope = true,
            },
            signs = {
                section = { "", "" },
                item    = { "", "" },
                hunk    = { "", "" },
            },
            disable_commit_confirmation = false,
        },
    },

    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<CR>",          desc = "Diffview" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<CR>",   desc = "Repo history" },
        },
    },
}
