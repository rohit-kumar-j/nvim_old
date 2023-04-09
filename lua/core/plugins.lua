-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- LSP Support
	{ 'neovim/nvim-lspconfig' }, -- Required
	{
		'williamboman/mason.nvim',
		build = function()
			pcall(vim.cmd, 'MasonUpdate')
		end,
	},
	{ 'williamboman/mason-lspconfig.nvim' },        -- For installing language servers
	{ 'WhoIsSethDaniel/mason-tool-installer.nvim' }, -- For installing dap, linters, formatters, etc.

	-- Autocompletion
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-nvim-lua' },
	{ 'hrsh7th/cmp-nvim-lsp' },

	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'rafamadriz/friendly-snippets' },
	{ 'onsails/lspkind.nvim' },

	{ "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
	{ "nvim-tree/nvim-tree.lua" },
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			'kdheepak/lazygit.nvim',
			'voldikss/vim-floaterm',
		}
	},
	-- { -- LSP
	--   {'neovim/nvim-lspconfig'},
	--   {'williamboman/mason-lspconfig.nvim'},
	--   {'williamboman/mason.nvim'},
	--   {'WhoIsSethDaniel/mason-tool-installer.nvim'},
	--   {'mfussenegger/nvim-dap'},
	--   {'jay-babu/mason-nvim-dap.nvim'},
	--   -- Autocompletiondev
	--   {'hrsh7th/cmp-nvim-lsp'},
	--   {'hrsh7th/cmp-buffer'},
	--   {'hrsh7th/cmp-path'},
	--   {'hrsh7th/cmp-cmdline'},
	--   {'hrsh7th/nvim-cmp'},
	--   -- Snippets
	--   {'L3MON4D3/LuaSnip'},
	--   {'saadparwaiz1/cmp_luasnip'},
	-- },
	{ 'folke/which-key.nvim' },
	{ 'nvim-lualine/lualine.nvim' },
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'numToStr/Comment.nvim' },
	{ 'ggandor/leap.nvim' },
	{ "akinsho/bufferline.nvim",            dependencies = "nvim-tree/nvim-web-devicons" },
	{ 'windwp/nvim-autopairs' },
	{ 'lewis6991/gitsigns.nvim' },
	{ 'projekt0n/github-nvim-theme' },
	{ 'folke/twilight.nvim' },
	{ 'folke/zen-mode.nvim' },
	{ 'terrortylor/nvim-comment' },
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'akinsho/toggleterm.nvim' },
	{ 'j-hui/fidget.nvim' },
	{ 'glepnir/dashboard-nvim' },
	{
		'Civitasv/cmake-tools.nvim',
		deendencies = {
			'nvim-tree/nvim-web-devicons',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			'mfussenegger/nvim-dap',
		},
	},
})
