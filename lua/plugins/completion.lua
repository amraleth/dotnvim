return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",

    opts = {
        keymap = {
            preset = "default",
            ["<CR>"] = { "accept", "fallback" },
        },
    },

    appearance = {
        nerd_font_variant = "mono",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            treesitter_highlighting = true,
            window = {
                max_width  = 80,
                max_height = 20,
                border     = "rounded",
            },
        },
        ghost_text = {
            enable = true,
        },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
        },

        snippets = {
            preset = "default",
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },

        opts_extend = {
            "sources.default"
        }
    },
}
