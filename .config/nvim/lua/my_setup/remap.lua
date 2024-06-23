vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>t", vim.cmd.Neotree)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- vim.keymap.set("n", "<leader>j", function ()
--     vim.cmd("sp | term") 
-- end)
