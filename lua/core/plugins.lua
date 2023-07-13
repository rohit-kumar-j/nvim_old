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
            'rmagatti/goto-preview',
            config = function()
                require('core.plugin_config.goto_preview')
            end
        },
        {
            'b0o/incline.nvim',
            config = function()
                require('core.plugin_config.incline')
            end
        },
        {
            "m4xshen/hardtime.nvim",
            enabled = false,
            event = "VeryLazy",
            opts = {
                disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "cmake_tools_terminal", "terminal",
                    "dashboard", "dapui_stacks", "dapui_console", "dapui-repl", "dapui_watches", "dapui_breakpoints" },
            }
        },
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'lervag/vimtex' },
        { 'emakman/neovim-latex-previewer' },
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
        {
            'madskjeldgaard/cppman.nvim',
            dependencies = {
                { 'MunifTanjim/nui.nvim' }
            },
            config = function()
                local cppman = require "cppman"
                cppman.setup()

                -- Make a keymap to open the word under cursor in CPPman
                vim.keymap.set("n", "<leader>cm", function()
                    cppman.open_cppman_for(vim.fn.expand("<cword>"))
                end)

                -- Open search box
                vim.keymap.set("n", "<leader>cc", function()
                    cppman.input()
                end)
            end
        },

        --- Themes
        {
            'projekt0n/github-nvim-theme',
            -- tag = 'v0.0.7',
            lazy = false,    -- make sure we load this during startup if it is your main colorscheme
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                require('core.plugin_config.themes.github_theme')
            end
            -- opts = {},
            -- opts = {
            --     experiments = {
            --         new_palettes = false
            --     },
            -- },
        },
        { 'rose-pine/neovim',      name = 'rose-pine' },
        { 'rebelot/kanagawa.nvim', name = 'kanagawa' },
        {
            'Shatur/neovim-ayu',
            lazy = false,
            priority = 1000,
            config = function() require('core.plugin_config.themes.ayu') end
        },
        {
            'catppuccin/nvim',
            priority = 1000,
            name = 'catppuccin',
            config = function() require('core.plugin_config.themes.catppuccin') end
        },
        { 'folke/tokyonight.nvim', },
        { 'loctvl842/monokai-pro.nvim', },
        { 'AhmedAbdulrahman/vim-aylin', }, --         name = 'vim-aylin' ,lazy=false},
        { 'mcchrish/zenbones.nvim',           dependencies = 'rktjmp/lush.nvim' },
        { 'uloco/bluloco.nvim',               dependencies = 'rktjmp/lush.nvim' },
        { 'tanvirtin/monokai.nvim', },
        { 'kaiuri/nvim-juliana', },
        { 'EdenEast/nightfox.nvim', },
        { 'shaunsingh/nord.nvim', },
        { 'navarasu/onedark.nvim', },
        { 'nyoom-engineering/oxocarbon.nvim', },
        { 'tiagovla/tokyodark.nvim', },
        { 'olimorris/onedarkpro.nvim', },
        { 'bluz71/vim-moonfly-colors', },
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
