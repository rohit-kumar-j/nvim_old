-- Globals
vim.api.nvim_set_var("debug", false)                   -- For debugging o/p
vim.api.nvim_set_var("copy_to_single_clipboard", false) -- Copy with y . Only tested to win32 and wsl

-------------------------------------------------
-- Global LSP Servers
vim.api.nvim_set_var("lsp_servers", 
    {
        {
            name = 'lua_ls',
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" } 
                    },
                }, 
            },
        },
        {
            name  = 'cmake',
            settings = {
                CMake = {
                    filetypes = { "cmake", "CMakeLists.txt" }
                },
            },
        },
        {
            name = 'clangd',
            settings = {
                clangd = {
              --      excludeArgs = { "-stdlib=libc++" }
                },
            },
        },
        {
            name = 'pyright',
        },
    }
)

-- Global LSP Linters
vim.api.nvim_set_var("lsp_linters", 
    {
        "luacheck",     -- lua
        "flake8",       -- python
        "cpplint",      -- C++
    }
)


-- Global LSP DAP
vim.api.nvim_set_var("lsp_dap", 
    {
        "debugpy",      -- python
        "codelldb",     -- C++
        "cpptools",     -- C++
    }
)

-- Global LSP Formatters
vim.api.nvim_set_var("lsp_formatters", 
    {
        "stylua",     -- lua
        "black",            -- python
        "clang-format",     -- C++, C
    }
)

-------------------------------------------------
-- Global Treesitter Servers
vim.api.nvim_set_var("treesitter_servers", 
    {
        "lua",
        "c",
        "cpp",
        "cmake",
    }
)

-------------------------------------------------
-- - TODO : WhichKey Tests -> LSP:l, BUFFERS:b, DAP:d

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]  -- Auto format on save
-- vim.opt.foldmethod = "expr"                                 -- Code Folding
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"             -- Code Folding

require("core.os_config")
require("core.settings")
require("core.plugins")

require("core.plugin_config.nvim-tree")
require("core.plugin_config.nvim-treesitter")
require("core.plugin_config.telescope")
require("core.plugin_config.twilight")
require("core.plugin_config.leap")
require("core.plugin_config.gitsigns")
require("core.plugin_config.autopairs")
require("core.plugin_config.bufferline")
require("core.plugin_config.nvim-comment")
require("core.plugin_config.lualine")
require("core.plugin_config.zen-mode")
require("core.plugin_config.indent-blankline")
require("core.plugin_config.toggleterm")
require("core.plugin_config.fidget")
require("core.plugin_config.comment")
require("core.plugin_config.cmake-tools")
require("core.plugin_config.lspconfig")
require("core.plugin_config.nvim-cmp")
require("core.plugin_config.themes.github_theme")
require("core.plugin_config.dashboard")

-- Call which key last
require("core.plugin_config.which-key")