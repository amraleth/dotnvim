return {
    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
        config = function ()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function ()
                    local jdtls = require("jdtls")

                    local root_marker = { "gradlew", "mvnw", "pom.xml", "build.gradle", ".git"}
                    local root_dir = require("jdtls.setup").find_root(root_marker)
                    if not root_dir then return end

                    local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
                    local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

                    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

                    local os_config = (vim.fn.has("mac") == 1 and "config_mac") or (vim.fn.has("unix") == 1 and "config_linux") or "config_win"

                    local config = {
                        cmd = {
                            "java",
                            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                            "-Dosgi.bundles.defaultStartLevel=4",
                            "-Declipse.product=org.eclipse.jdt.ls.core.product",
                            "-Dlog.protocol=true",
                            "-Dlog.level=ALL",
                            "-Xmx2g",                                  -- adjust if low-RAM
                            "--add-modules=ALL-SYSTEM",
                            "--add-opens", "java.base/java.util=ALL-UNNAMED",
                            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                            "-jar", vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
                            "-configuration", mason_path .. "/" .. os_config,
                            "-data", workspace_dir,
                        },

                        root_dir = root_dir,

                        capabilities = require("blink.cmp").get_lsp_capabilities(),

                        settings = {
                            java = {
                                signatureHelp = { enable = true },
                                completion = { favoriteStaticMembers = {
                                    "org.junit.Assert.*", "org.junit.jupiter.api.Assertions.*",
                                    "java.util.Objects.requireNonNull",
                                }},
                                sources = {
                                    organizeImports = { 
                                        starThreshold = 9999,
                                        staticStarThreshold = 9999,
                                    },
                                },
                            },
                            init_options = {
                                bundles = {},
                            }
                        },
                    }
                    jdtls.start_or_attach(config)
                end,
            })
        end,
    },
}
