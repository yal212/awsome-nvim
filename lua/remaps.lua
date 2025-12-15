vim.g.mapleader = " "

vim.keymap.set("n", "gC", "gcc")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- page down/up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- apparently the greatest remap ever
-- makes pasting easier paste and selected text goes to void register
vim.keymap.set("x", "<leader>p", '"_dp')
-- same but for d
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- apparently the next greatest remap ever
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- no Q for you
vim.keymap.set("n", "Q", "<nop>")

-- project swap
-- haven't really figured it out yet
vim.keymap.set("n", "<C-p>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- change same work throughout the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window
vim.keymap.set("n", "<leader>w", "<C-w>")
