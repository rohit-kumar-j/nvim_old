-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup(
    {
        view = {
            side = 'left',
            width = 35,
            preserve_window_proportions = true,
            -- auto_resize = true,
        }
    }
)
