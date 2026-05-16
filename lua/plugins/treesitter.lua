return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdate", "TSInstall", "TSInstallInfo", "TSUpdateSync" },
        opts = {
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query",
                "bash", "markdown", "markdown_inline",
                "json", "yaml", "toml",
                "diff", "gitcommit", "gitignore",
                "python", "rust", "go", "tsx", "html", "css"
            },
            auto_install = true,
            sync_install = false,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
                -- disable = { "python", "yaml" },
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection    = "<C-space>",
                    node_incremental  = "<C-space>",
                    scope_incremental = false,
                    node_decremental  = "<BS>",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
