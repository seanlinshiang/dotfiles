local call = vim.call
local cmd = vim.cmd
local Plug = vim.fn['plug#']

vim.call('plug#begin')
	Plug('mg979/vim-visual-multi', "{'branch': 'master'}")
vim.call('plug#end')
