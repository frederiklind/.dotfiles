return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "csharp_ls",
                    "cssls",
                    "cssmodules_ls",
                    "fsautocomplete",
                    "html",
                    "jsonls",
                    "ts_ls",
                    "pylsp",
                    "jdtls",
                    "texlab",
                    "clangd",
                },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Detect which API is available
            local ok, new_lsp = pcall(function()
                return vim.lsp.config
            end)
            local lsp = ok and new_lsp or require("lspconfig")

            local signs = {
                Error = " ",
                Warn = " ",
                Hint = " ",
                Info = " ",
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Setup servers
            local servers = {
                "lua_ls",
                "rust_analyzer",
                "csharp_ls",
                "cssls",
                "cssmodules_ls",
                "fsautocomplete",
                "html",
                "jdtls",
                "jsonls",
                "pylsp",
                "texlab",
                "ts_ls",
                "clangd",
            }

            for _, server in ipairs(servers) do
                local cfg = { capabilities = capabilities }

                -- special settings
                if server == "lua_ls" then
                    cfg.settings = {
                        Lua = { diagnostics = { globals = { "vim" } } },
                    }
                elseif server == "rust_analyzer" then
                    cfg.settings = {
                        cargo = { allFeatures = true },
                        checkOnSave = { command = "clippy" },
                        inlayHints = { enable = true },
                    }
                elseif server == "ts_ls" then
                    cfg.settings = {
                        typescript = { format = { enable = false } },
                        javascript = { format = { enable = false } },
                    }
                end

                if lsp[server] and lsp[server].setup then
                    lsp[server].setup(cfg)
                end
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
