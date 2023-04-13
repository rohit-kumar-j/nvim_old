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
    { 'folke/which-key.nvim',                lazy = false },
    { 'nvim-lualine/lualine.nvim',           lazy = false },
    { 'lukas-reineke/indent-blankline.nvim', lazy = false },
    { 'numToStr/Comment.nvim',               lazy = false },
    { 'ggandor/leap.nvim',                   lazy = false },
    { "akinsho/bufferline.nvim",             dependencies = "nvim-tree/nvim-web-devicons", lazy = false },
    { 'windwp/nvim-autopairs',               lazy = false },
    { 'lewis6991/gitsigns.nvim',             lazy = false },
    { 'David-Kunz/markid',                   lazy = false },

    --- Themes
    { 'projekt0n/github-nvim-theme',         lazy = false },
    { 'rose-pine/neovim',                    name = 'rose-pine',                           lazy = false },
    { 'rebelot/kanagawa.nvim',               name = 'kanagawa',                            lazy = false },
    { 'catppuccin/nvim',                     name = 'catppuccin',                          lazy = false },
    { 'folke/tokyonight.nvim',               lazy = false },
    { 'loctvl842/monokai-pro.nvim',          lazy = false },
    { 'AhmedAbdulrahman/vim-aylin',          lazy = false }, --         name = 'vim-aylin' ,lazy=false},
    { 'mcchrish/zenbones.nvim',              dependencies = 'rktjmp/lush.nvim',            lazy = false },
    { 'uloco/bluloco.nvim',                  dependencies = 'rktjmp/lush.nvim',            lazy = false },
    { 'tanvirtin/monokai.nvim',              lazy = false },
    { 'kaiuri/nvim-juliana',                 lazy = false },
    { 'EdenEast/nightfox.nvim',              lazy = false },
    { 'shaunsingh/nord.nvim',                lazy = false },
    { 'navarasu/onedark.nvim',               lazy = false },
    { 'nyoom-engineering/oxocarbon.nvim',    lazy = false },
    { 'tiagovla/tokyodark.nvim',             lazy = false },
    { 'olimorris/onedarkpro.nvim',           lazy = false },
    { 'sam4llis/nvim-tundra',                lazy = false },
    { 'bluz71/vim-moonfly-colors',           lazy = false },

    --
    { 'folke/twilight.nvim',                 lazy = false },
    {
        'folke/todo-comments.nvim',
        lazy = false,
        dependencies =
        'nvim-lua/plenary.nvim'
    },
    { 'folke/zen-mode.nvim',                 lazy = false },
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
})
