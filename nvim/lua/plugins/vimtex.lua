return {
    'lervag/vimtex',
    lazy = false,
    config = function()
        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_highlight_enabled = 1
        vim.g.vimtex_view_method = "zathura"
        vim.keymap.set('n', '<leader>ll', '<plug>(vimtex-compile)')
        vim.keymap.set('n', '<leader>ls', '<plug>(vimtex-stop)')
        vim.keymap.set('n', '<leader>lc', ':VimtexClean!<CR>')
    end
}
