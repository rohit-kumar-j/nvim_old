-- Install package manager
--    https://github.com/folke/lazy.nvimplug
--    `:help lazy.nvim.txt` for more info

local vim = vim
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
        { 'neovim/nvim-lspconfig',    lazy = false }, -- Required
        { 'weizheheng/nvim-workbench' },
        {
            "m4xshen/hardtime.nvim",
            event = "VeryLazy",
            opts = { disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "terminal", "dashboard" },
            }
        },
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim',         lazy = true }, -- For installing language servers
        { 'WhoIsSethDaniel/mason-tool-installer.nvim', lazy = true }, -- For installing dap, linters, formatters, etc.
        -- Autocompletion
        { 'hrsh7th/nvim-cmp',                          tag = 'v0.0.1', lazy = true },
        { 'hrsh7th/cmp-buffer',                        lazy = true },
        { 'hrsh7th/cmp-path',                          lazy = true },
        { 'hrsh7th/cmp-nvim-lua',                      lazy = true },
        { 'hrsh7th/cmp-nvim-lsp',                      lazy = true },
        { 'L3MON4D3/LuaSnip',                          lazy = true,    build = "make install_jsregexp" },
        { 'saadparwaiz1/cmp_luasnip',                  lazy = true },
        { 'rafamadriz/friendly-snippets',              lazy = true },
        { 'rcarriga/nvim-notify',                      lazy = true },
        { 'onsails/lspkind.nvim',                      lazy = true },
        { "nvim-treesitter/nvim-treesitter",           lazy = true,    build = ":TSUpdate" },
        { "nvim-tree/nvim-tree.lua",                   lazy = false },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
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
            lazy = true
        },
        { 'folke/neodev.nvim',                   lazy = true },
        { 'nvim-lualine/lualine.nvim',           lazy = true },
        { 'lukas-reineke/indent-blankline.nvim', lazy = true },
        { 'numToStr/Comment.nvim',               lazy = true },
        { 'ggandor/leap.nvim',                   lazy = true },
        { "akinsho/bufferline.nvim",             lazy = true, dependencies = "nvim-tree/nvim-web-devicons" },
        { 'windwp/nvim-autopairs',               lazy = true },
        {
            'andrewferrier/wrapping.nvim',
            lazy = true,
            config = function()
                require("wrapping").setup()
            end
        },
        { 'lewis6991/gitsigns.nvim',           lazy = true },
        { 'David-Kunz/markid',                 lazy = true }, -- highlight same-name identifiers with the same colors

        --- DAP
        { 'rcarriga/nvim-dap-ui',              lazy = true },
        { 'mfussenegger/nvim-dap',             lazy = true },
        { 'ldelossa/nvim-dap-projects',        lazy = true },
        { 'theHamsta/nvim-dap-virtual-text',   lazy = true },
        { 'nvim-telescope/telescope-dap.nvim', lazy = true },
        {
            'rcarriga/nvim-dap-ui',
            lazy = true,
            dependencies = {
                'mfussenegger/nvim-dap',
            },
        },

        --- Themes
        {
            'projekt0n/github-nvim-theme',
            tag = 'v0.0.7',
            lazy = true,
            -- opts = {},
            -- opts = {
            --     experiments = {
            --         new_palettes = false
            --     },
            -- },
        },
        { 'rose-pine/neovim',      lazy = true, name = 'rose-pine' },
        { 'rebelot/kanagawa.nvim', lazy = true, name = 'kanagawa' },
        {
            'catppuccin/nvim',
            lazy = "VeryLazy",
            name = 'catppuccin',
            config = function() require('core.plugin_config.themes.catppuccin') end
        },
        { 'folke/tokyonight.nvim',            lazy = true },
        { 'loctvl842/monokai-pro.nvim',       lazy = true },
        { 'AhmedAbdulrahman/vim-aylin',       lazy = true }, --         name = 'vim-aylin' ,lazy=false},
        { 'mcchrish/zenbones.nvim',           lazy = true, dependencies = 'rktjmp/lush.nvim' },
        { 'uloco/bluloco.nvim',               lazy = true, dependencies = 'rktjmp/lush.nvim' },
        { 'tanvirtin/monokai.nvim',           lazy = true },
        { 'kaiuri/nvim-juliana',              lazy = true },
        { 'EdenEast/nightfox.nvim',           lazy = true },
        { 'shaunsingh/nord.nvim',             lazy = true },
        { 'navarasu/onedark.nvim',            lazy = true },
        { 'nyoom-engineering/oxocarbon.nvim', lazy = true },
        { 'tiagovla/tokyodark.nvim',          lazy = true },
        { 'olimorris/onedarkpro.nvim',        lazy = true },
        { 'bluz71/vim-moonfly-colors',        lazy = true },
        --
        { 'folke/twilight.nvim',              lazy = true },
        {
            'folke/todo-comments.nvim',
            lazy = true,
            dependencies =
            'nvim-lua/plenary.nvim'
        },
        { 'folke/zen-mode.nvim',   lazy = true },
        { 'Pocco81/true-zen.nvim', lazy = false },
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
                -- glow_path = "C:\\Users\\Rohit\\scoop\\shims\\glow.exe",
            },
        },
        -- { 'hood/popui.nvim',                     lazy = false },
        -- { 'chentoast/marks.nvim',                lazy = false },
        {
            'kevinhwang91/nvim-ufo',
            lazy         = false,
            dependencies = {
                'kevinhwang91/promise-async',
            },
            -- init         = function()
            --     vim.o.foldcolumn = '1' -- '0' is not bad
            --     vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            --     vim.o.foldlevelstart = 99
            --     vim.o.foldenable = true
            -- end,
        },
        { 'ThePrimeagen/harpoon',     lazy = true },
        { 'mcauley-penney/tidy.nvim', lazy = true },
        { 'terrortylor/nvim-comment', lazy = true },
        { 'akinsho/toggleterm.nvim',  lazy = true },
        { 'j-hui/fidget.nvim',        lazy = true, tag = 'legacy' },
        { 'glepnir/dashboard-nvim',   lazy = false },
        {
            'rohit-kumar-j/cmake-tools.nvim',
            branch = "master",
            dependencies = {
                'nvim-tree/nvim-web-devicons',
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-ui-select.nvim',
                'mfussenegger/nvim-dap',
            },
            lazy = true,
        },
        -- Organization with `.norg` files
        {
            "nvim-neorg/neorg",
            build = ":Neorg sync-parsers",
            opts = {
                load = {
                    ["core.defaults"] = {},  -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = {      -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            },
            dependencies = { { "nvim-lua/plenary.nvim" } },
            lazy = true
        },
    },

    -- ChatGpt : Not tested or enabled
    -- {
    --   'jackMort/ChatGPT.nvim',
    --   -- event = 'VeryLazy',
    --   config = function()
    --     require('core.plugin-config.chatgpt').setup({
    --
    --     })
    --   end,
    --   dependencies = {
    --     'MunifTanjim/nui.nvim',
    --     'nvim-lua/plenary.nvim',
    --     'nvim-telescope/telescope.nvim'
    --   }
    -- },

    -- UI
    {
        ui = {
            border = "rounded"
        },
        checker = { -- Check fo rupdates
            enabled = true,
        },
        icons = {
            cmd = " ",
            config = "🛠",
            event = "",
            ft = "📂",
            init = "⚙",
            import = " ",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            loaded = "●",
            not_loaded = "○",
            source = "📄",
            start = "🚀",
            -- task = "📌",
            task = "✔ ",
            lazy = "💤 ",
            list = {
                "●",
                "➜",
                "★",
                "‒",
            },
        },
    }

)
