return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
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

                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        format = {
                            enable = true,
                        }
                    }
                }
            })
            lspconfig.pylsp.setup({
                settings = {
                    pyslsp = {
                        plugins = {
                            black = { enabled = true }
                        }
                    }
                }
            })
            lspconfig.html.setup({
                filetypes = { "html" }
            })
            lspconfig.clangd.setup({
                filetypes = { "c", "cpp" }
            })
            lspconfig.cssls.setup({
                filetypes = { "css" }
            })
            lspconfig.marksman.setup({
                filetypes = { "md" }
            })
            lspconfig.texlab.setup({
                settings = {
                    texlab = {
                        build = {
                            executable = "latexmk",
                            args = { "pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                            onSave = true
                        },
                        forwardSearch = {
                            executable = "zathura",
                            args = { "--synctex-forward", "%l:1:%f", "%p" }
                        }
                    }
                }
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
        end
    }
}
