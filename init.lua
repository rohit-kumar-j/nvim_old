-- Globals
local vim = vim
vim.api.nvim_set_var('debug', false)                    -- For debugging o/p
vim.api.nvim_set_var('copy_to_single_clipboard', false) -- Copy with y . Only tested to win32 and wsl

-------------------------------------------------
-- Global LSP Servers
vim.api.nvim_set_var('lsp_servers',
    {
        {
            name = 'lua_ls',
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                },
            },
        },
        {
            name     = 'cmake',
            settings = {
                CMake = {
                    filetypes = { 'cmake', 'CMakeLists.txt', 'CMakeCache.txt' },
                },
            },
        },
        {
            name = 'clangd',
            cmd = {
                "clangd",
                -- "--background-index",
                -- "-ID:\\VS2022\\Koala\\external",
                --     "--clang-tidy",
                --     "--header-insertion=iwyu",
                --     "--completion-style=detailed",
                --     "--function-arg-placeholders",
                --     "--suggest-missing-includes",
                -- "--query-driver='C:\\Program Files\\LLVM\\bin\\clangd.exe'"
            },
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname)
            end,
            -- init_options = {
            --     usePlaceholders = true,
            --     completeUnimported = true,
            --     clangdFileStatus = true
            -- includePaths = { "D:\\VS2022\\Koala\\external" },
            -- },
            settings = {
                clangd = {
                    extraArgs = {
                        -- "-ID:\\VS2022\\Koala\\external",
                    }
                    --      excludeArgs = { '-stdlib=libc++' }
                },
            },
        },
        {
            name = 'pyright',
        },
        {
            name = 'jsonls', -- for json formatting
        },
        {
            name = 'ltex', -- for markdown lsp
        },
        {
            name = 'esbonio', -- for reStructuredText lsp
        },
        {
            name = 'lemminx', -- for xml
        }
    }
)

-- Global LSP Linters
vim.api.nvim_set_var('lsp_linters',
    {
        'luacheck', -- lua
        'flake8',   -- python
        'cpplint',  -- C++
        'jsonlint', -- json
        'textlint', -- markdown
        -- No linters for xml
    }
)


-- Global LSP DAP
vim.api.nvim_set_var('lsp_dap',
    {
        'debugpy',  -- python
        'codelldb', -- C++
        'cpptools', -- C++
        -- No dap for json
        -- No dap for markdown
        -- No dap for reStructuredText
        -- No dap for xml
    }
)

-- Global LSP Formatters
vim.api.nvim_set_var('lsp_formatters',
    {
        'stylua',       -- lua
        'black',        -- python
        'clang-format', -- C++, C
        'fixjson',      --json
        'prettierd',    -- markdown
        -- No formatter for reStructuredText
        'xmlformatter'  -- xml
    }
)

-------------------------------------------------
-- Global Treesitter Servers
vim.api.nvim_set_var('treesitter_servers',
    {
        'lua',
        'c',
        'cpp',
        'cmake',
        'norg',
        -- No treesitter server for xml
        'vim', -- This solves syntax highlighting in {.lua} files
    }
)

-------------------------------------------------
-- - TODO : WhichKey Tests -> LSP:l, BUFFERS:b, DAP:d

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]] -- Auto format on save
-- vim.opt.foldmethod = 'expr'                                 -- Code Folding
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'             -- Code Folding

-- PLUGINS
require('core.os_config')

-- Install plugins
require('core.plugins')
require('core.settings')

require('core.plugin_config.nvim-tree')
require('core.plugin_config.nvim-treesitter')
require('core.plugin_config.telescope')
require('core.plugin_config.twilight')
require('core.plugin_config.leap')
require('core.plugin_config.lazygit')
require('core.plugin_config.gitsigns')
require('core.plugin_config.autopairs')
require('core.plugin_config.bufferline')
require('core.plugin_config.nvim-comment')
require('core.plugin_config.lualine')
require('core.plugin_config.zen-mode')
require('core.plugin_config.indent-blankline')
require('core.plugin_config.toggleterm')
require('core.plugin_config.fidget')
require('core.plugin_config.comment')
require('core.plugin_config.cmake-tools')
require('core.plugin_config.lspconfig')
require('core.plugin_config.nvim-cmp')
require('core.plugin_config.dashboard')
require('core.plugin_config.glow')
require('core.plugin_config.tidy')
require('core.plugin_config.neorg')
require('core.plugin_config.notify')
require('core.plugin_config.todo-comments')
-- require('core.plugin_config.popui')

-- Call which key last
require('core.plugin_config.which-key')
require('core.plugin_config.markid')



require('core.plugin_config.themes.github_theme')
require('core.plugin_config.themes.catppuccin')
require('core.plugin_config.themes.rose-pine')
-- require('core.plugin_config.themes.kanagawa')
-- require('core.plugin_config.themes.monokai-pro')
-- require('core.plugin_config.themes.aylin') -- do not require this
-- require('core.plugin_config.themes.kanagawa')
-- require('core.plugin_config.themes.juliana')
-- require('core.plugin_config.themes.nightfox')
-- require('core.plugin_config.themes.onedark')
-- require('core.plugin_config.themes.tundra')
-- require('core.plugin_config.themes.onedark-pro')
-- require('core.plugin_config.themes.onehalf')


-- vim.cmd.colorscheme('rose-pine')
-- vim.cmd.colorscheme('github_dark_default')
-- vim.cmd.colorscheme('nord')
-- vim.cmd.colorscheme('carbonfox')
vim.cmd.colorscheme('catppuccin-mocha')
-- vim.cmd.colorscheme('tokyonight')
-- vim.cmd.colorscheme('kanagawa')
-- vim.cmd.colorscheme('aylin')
-- vim.cmd.colorscheme('monokai-pro')
-- vim.cmd.colorscheme('onehalfdark')
-- vim.cmd.colorscheme('moonfly')



-- for token in string.gmatch(os.getenv('PATH'), '[^;]+') do
-- 	print(token)
-- end
