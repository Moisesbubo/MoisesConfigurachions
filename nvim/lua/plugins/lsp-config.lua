return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pylsp",
                    "html",
                    "clangd",
                    "cssls",
                    "marksman",
                    "texlab",
                },
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local on_attach = function(client, bufnr)
                local map = function(mode, keys, func, desc)
                    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
                end

                -- Ver documentação
                map('n', 'K', vim.lsp.buf.hover, "Hover documentation")
                -- Ir para definição
                map('n', 'gd', vim.lsp.buf.definition, "Go to definition")
                -- Ações de código (CORREÇÃO DO ERRO)
                map('n', '<leader>ca', vim.lsp.buf.code_action, "Code action (normal)")
                map('v', '<leader>ca', vim.lsp.buf.code_action, "Code action (visual)")
                -- Formatar documento
                map('n', '<leader>fg', function()
                    vim.lsp.buf.format({ async = true })
                end, "Format document")
                -- Renomear símbolo
                map('n', '<leader>rn', vim.lsp.buf.rename, "Rename symbol")
                -- Mostrar diagnósticos
                map('n', '<leader>d', vim.diagnostic.open_float, "Show diagnostics")
            end

            -- Configurações específicas para cada servidor
            ----------------------------------------------

            -- Lua
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        format = { enable = true },
                        telemetry = { enable = false },
                    }
                }
            })

            -- Python
            lspconfig.pylsp.setup({
                on_attach = on_attach,
                settings = {
                    pylsp = {
                        plugins = {
                            black = { enabled = true },
                            pycodestyle = { enabled = true, maxLineLength = 120 },
                            pyflakes = { enabled = true },
                            jedi_completion = { enabled = true },
                            pylint = { enabled = false },
                        }
                    }
                }
            })

            -- HTML
            lspconfig.html.setup({
                on_attach = on_attach,
                filetypes = { "html", "htmldjango" }
            })

            -- C/C++
            lspconfig.clangd.setup({
                on_attach = on_attach,
                filetypes = { "c", "cpp", "cc", "h", "hpp" },
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                },
            })

            -- CSS
            lspconfig.cssls.setup({
                on_attach = on_attach,
                filetypes = { "css", "scss", "less" }
            })

            -- Markdown
            lspconfig.marksman.setup({
                on_attach = on_attach,
                filetypes = { "markdown", "md" }
            })

            -- LaTeX
            lspconfig.texlab.setup({
                on_attach = on_attach,
                settings = {
                    texlab = {
                        build = {
                            executable = "latexmk",
                            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                            onSave = true
                        },
                        forwardSearch = {
                            executable = "zathura",
                            args = { "--synctex-forward", "%l:1:%f", "%p" }
                        },
                        chktex = {
                            onOpenAndSave = true
                        }
                    }
                }
            })

            -- Configuração global de diagnósticos
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    source = "always",
                    border = "rounded",
                },
            })

            -- Símbolos de diagnóstico
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end
        end
    }
}
