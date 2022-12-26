-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,
})

vim.cmd.colorscheme("rose-pine")
