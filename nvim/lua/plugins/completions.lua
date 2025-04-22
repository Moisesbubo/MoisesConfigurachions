return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',           -- Completar do buffer
            'hrsh7th/cmp-path',             -- Completar de paths
            'hrsh7th/cmp-nvim-lsp',         -- Completar do LSP
            'saadparwaiz1/cmp_luasnip',     -- Completar para luasnip
            'L3MON4D3/LuaSnip',             -- Engine de snippets
            'rafamadriz/friendly-snippets', -- Snippets pré-definidos
            'windwp/nvim-autopairs',
        },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            local autopairs = require('nvim-autopairs')
            autopairs.setup({
                check_ts = true,
            })

            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' }, -- Completar do LSP
                    { name = 'luasnip' },  -- Completar de snippets
                    { name = 'buffer' },   -- Completar do buffer
                    { name = 'path' },     -- Completar de paths
                })
            })
        end,
    }
}
