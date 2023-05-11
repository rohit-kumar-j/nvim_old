local vim = vim

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 10,
    }
})
require("telescope").load_extension('harpoon')
