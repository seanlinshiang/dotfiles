function ColorMyPencils(color)
	require('rose-pine').setup({ 
		disable_italics = true,
		disable_background = true
	})
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()

	
