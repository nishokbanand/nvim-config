vim.g.mapleader = " "
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--open up explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--center while moving up or down pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--paste without replace
vim.keymap.set("x", "<leader>p", "\"_dP")
--keep cursor in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--add next line to existing line without moving cursor
vim.keymap.set("n", "J", "mzJ`z")
--replace the word that is on
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
--move in quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
