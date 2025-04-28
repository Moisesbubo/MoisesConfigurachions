--Number lines
vim.cmd("set nu")
vim.cmd("set rnu")

--Cursor line
vim.cmd("set cursorline")
vim.cmd("highlight CursorLineNr ctermfg=208 guifg=#FFA500 ")
vim.cmd("set signcolumn=yes")
vim.cmd("set colorcolumn=80")

--Tab
vim.cmd("set expandtab")
vim.cmd("set softtabstop=4")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smartindent")

--Search
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set smartcase")
vim.cmd("set ignorecase")
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })

--Scroll
vim.cmd("set scrolloff=4")

--Mapping
vim.g.mapleader = " "

--Resize Windows
vim.keymap.set('n', '<C-h>', ':vertical resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<C-l>', ':vertical resize +2<CR>', { noremap = true })

--Moving lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

--Clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+Y')
vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p')
vim.keymap.set({ 'v', 'n' }, '<leader>P', '"+P')
