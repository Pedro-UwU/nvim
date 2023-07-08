require('catppuccin').setup({
	flavour = 'frappe',
		transparent_background = true,
		show_end_of_buffer = false,
		integrations = {
			cmp = true,
			telescope = true
		},
    		require("catppuccin").setup(settings)
	})

vim.cmd('colorscheme catppuccin')

