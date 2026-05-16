return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "echasnovski/mini.icons"},
        opts = {
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = false,

            columns = {
                --"icon",
                "permissions",
                "size",
                "mtime",
            },

            view_options = {
                show_hidden = true,
                natural_order = true,
                case_insensitive = false,
                is_always_hidden = function(name, _)
                    return name == ".." or name == ".git"
                end,
            },

            win_options = {
                wrap = false,
                signcolumn = "yes:2",
            },

            keymaps = {
                ["g?"]    = "actions.show_help",
                ["<CR>"]  = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical   = true } },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-t>"] = { "actions.select", opts = { tab        = true } },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"]     = "actions.parent",
                ["_"]     = "actions.open_cwd",
                ["`"]     = "actions.cd",
                ["~"]     = { "actions.cd", opts     = { scope      = "tab" } },
                ["gs"]    = "actions.change_sort",
                ["gx"]    = "actions.open_external",
                ["g."]    = "actions.toggle_hidden",
                ["g\\"]   = "actions.toggle_trash",
            },
            use_default_keymaps = false,
        },
        keys = {
            { "<leader><Tab>", "<cmd>Oil<CR>", desc = "Open oil" },
            { "-",             "<cmd>Oil<CR>", desc = "Open parent dir (oil)" },
        },
    },
}
