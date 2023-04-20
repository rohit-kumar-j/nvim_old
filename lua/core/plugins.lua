-- Install package manager
--    https://github.com/folke/lazy.nvimplug
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
		{ 'neovim/nvim-lspconfig',                     lazy = false }, -- Required
		{
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{ 'williamboman/mason-lspconfig.nvim',         lazy = false }, -- For installing language servers
		{ 'WhoIsSethDaniel/mason-tool-installer.nvim', lazy = false }, -- For installing dap, linters, formatters, etc.
		-- Autocompletion
		{ 'hrsh7th/nvim-cmp',                          lazy = false },
		{ 'hrsh7th/cmp-buffer',                        lazy = false },
		{ 'hrsh7th/cmp-path',                          lazy = false },
		{ 'hrsh7th/cmp-nvim-lua',                      lazy = false },
		{ 'hrsh7th/cmp-nvim-lsp',                      lazy = false },
		{ 'L3MON4D3/LuaSnip',                          lazy = false },
		{ 'saadparwaiz1/cmp_luasnip',                  lazy = false },
		{ 'rafamadriz/friendly-snippets',              lazy = false },
		{ 'onsails/lspkind.nvim',                      lazy = false },
		{ "nvim-treesitter/nvim-treesitter",           lazy = false, build = ":TSUpdate" },
		{ "nvim-tree/nvim-tree.lua",                   lazy = false },
		{
			'nvim-telescope/telescope.nvim',
			version = '*',
			lazy = false,
			dependencies = {
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-ui-select.nvim',
				'kdheepak/lazygit.nvim',
				'voldikss/vim-floaterm',
			}
		},
		{
			'folke/which-key.nvim',
			tag = 'v1.2.2',
			lazy = false
		},
		{ 'nvim-lualine/lualine.nvim',           lazy = false },
		{ 'lukas-reineke/indent-blankline.nvim', lazy = false },
		{ 'numToStr/Comment.nvim',               lazy = false },
		{ 'ggandor/leap.nvim',                   lazy = false },
		{ "akinsho/bufferline.nvim",             dependencies = "nvim-tree/nvim-web-devicons", lazy = false },
		{ 'windwp/nvim-autopairs',               lazy = false },
		{ 'lewis6991/gitsigns.nvim',             lazy = false },
		{ 'David-Kunz/markid',                   lazy = false }, -- highlight same-name identifiers with the same colors
		--- Themes
		{
			'projekt0n/github-nvim-theme',
			tag = 'v0.0.7',
			lazy = false,
			-- opts = {},
			-- opts = {
			--     experiments = {
			--         new_palettes = false
			--     },
			-- },
		},
		{ 'rose-pine/neovim',                 name = 'rose-pine',                lazy = false },
		{ 'rebelot/kanagawa.nvim',            name = 'kanagawa',                 lazy = false },
		{ 'catppuccin/nvim',                  name = 'catppuccin',               lazy = false },
		{ 'folke/tokyonight.nvim',            lazy = false },
		{ 'loctvl842/monokai-pro.nvim',       lazy = false },
		{ 'AhmedAbdulrahman/vim-aylin',       lazy = false }, --         name = 'vim-aylin' ,lazy=false},
		{ 'mcchrish/zenbones.nvim',           dependencies = 'rktjmp/lush.nvim', lazy = false },
		{ 'uloco/bluloco.nvim',               dependencies = 'rktjmp/lush.nvim', lazy = false },
		{ 'tanvirtin/monokai.nvim',           lazy = false },
		{ 'kaiuri/nvim-juliana',              lazy = false },
		{ 'EdenEast/nightfox.nvim',           lazy = false },
		{ 'shaunsingh/nord.nvim',             lazy = false },
		{ 'navarasu/onedark.nvim',            lazy = false },
		{ 'nyoom-engineering/oxocarbon.nvim', lazy = false },
		{ 'tiagovla/tokyodark.nvim',          lazy = false },
		{ 'olimorris/onedarkpro.nvim',        lazy = false },
		{ 'sam4llis/nvim-tundra',             lazy = false },
		{ 'bluz71/vim-moonfly-colors',        lazy = false },
		--
		{ 'folke/twilight.nvim',              lazy = false },
		{
			'folke/todo-comments.nvim',
			lazy = false,
			dependencies =
			'nvim-lua/plenary.nvim'
		},
		{ 'folke/zen-mode.nvim',                 lazy = false },
		-- {
		--     'iamcco/markdown-preview.nvim',
		--     ft = "markdown",
		--     build = function() vim.fn["mkdp#util#install"]() end,
		--     lazy = false
		-- },
		{
			'ellisonleao/glow.nvim',
			lazy = false,
			cmd = "Glow",
			opts = {
				glow_path = "C:\\Users\\Rohit\\scoop\\shims\\glow.exe",
			},
		},
		{ 'mcauley-penney/tidy.nvim',            lazy = false },
		{ 'terrortylor/nvim-comment',            lazy = false },
		{ 'lukas-reineke/indent-blankline.nvim', lazy = false },
		{ 'akinsho/toggleterm.nvim',             lazy = false },
		{ 'j-hui/fidget.nvim',                   lazy = false },
		{ 'glepnir/dashboard-nvim',              lazy = false },
		{
			'rohit-kumar-j/cmake-tools.nvim',
			deendencies = {
				'nvim-tree/nvim-web-devicons',
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-ui-select.nvim',
				'mfussenegger/nvim-dap',
			},
			lazy = false
		},
		-- Organization with `.norg` files
		{
			"nvim-neorg/neorg",
			build = ":Neorg sync-parsers",
			opts = {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {
						config = {
							folds = true,
							icon_preset = 'varied', -- basic, diamond, varied
						},
					},         -- Adds pretty icons to your documents
					-- ["core.norg.dirman"] = {      -- Manages Neorg workspaces
					--     config = {
					--         workspaces = {
					--             notes = "~/notes",
					--         },
					--     },
					-- },
				},
			},
			dependencies = { { "nvim-lua/plenary.nvim" } },
		},
	},
	{
		ui = {
			border = "single"
		},
		checker = { -- Check fo rupdates
			enabled = false,
		},
	}
)
