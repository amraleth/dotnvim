return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = { "clangd", "lua_ls" },
            automatic_installation = true,
        },
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.lsp.util.open_floating_preview = (function (orig)
                return function(contents, syntax, opts, ...)
                    opts = opts or {}
                    opts.border = opts.border or "rounded"
                    return orig(contents, syntax, opts, ...)
                end
            end)(vim.lsp.util.open_floating_preview)
            vim.api.nvim_create_autocmd("LspAttach", {

                callback = function(args)
                    local buf = args.buf
                    local map = function(keys, fn, desc)
                        vim.keymap.set("n", keys, fn, { buffer = buf, desc = "LSP: " .. desc })
                    end

                    map("gd",         vim.lsp.buf.definition,     "Goto definition")
                    map("gD",         vim.lsp.buf.declaration,    "Goto declaration")
                    map("gr",         vim.lsp.buf.references,     "References")
                    map("gi",         vim.lsp.buf.implementation, "Implementation")
                    map("K",          vim.lsp.buf.hover,          "Hover docs")
                    map("<leader>rn", vim.lsp.buf.rename,         "Rename")
                    map("<leader>ca", vim.lsp.buf.code_action,    "Code action")
                    map("<leader>cp", vim.diagnostic.goto_prev,   "Prev diagnostic")
                    map("<leader>cd", vim.diagnostic.goto_next,   "Next diagnostic")
                    map("<leader>e",  vim.diagnostic.open_float,  "Show diagnostic")
                end,
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            })

            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            vim.lsp.config("clangd", {})

            vim.lsp.enable({ "lua_ls", "clangd" })
        end,
    },
}
