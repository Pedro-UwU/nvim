return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'BurntSushi/ripgrep'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  	requires = { 
		{'nvim-lua/plenary.nvim'}, 
    		{ "nvim-telescope/telescope-live-grep-args.nvim" },
  	},
  	config = function()
    	require("telescope").load_extension("live_grep_args")
  	end
  }

  use({
    	'rose-pine/neovim',
    	as = 'rose-pine',
  })

  use ({ 
	"catppuccin/nvim", 
	as = "catppuccin",
  })
  
  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('tpope/vim-fugitive')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'zbirenbaum/copilot.lua'
  use 'zbirenbaum/copilot-cmp'

end)
