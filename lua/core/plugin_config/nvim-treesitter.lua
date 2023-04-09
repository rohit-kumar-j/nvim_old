local treesitter_servers = vim.api.nvim_get_var('treesitter_servers')

require("nvim-treesitter.configs").setup (
    {
        ensure_installed = treesitter_servers,
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        }
    }
)