vim.opt.termguicolors = true

require("bufferline").setup {
  -- highlights = require("catppuccin.groups.integrations.bufferline").get()
  -- options = {
  --     separator_style = "slant",
  -- show_tab_indicators = true,
  -- },
  -- highlights = highlights,
}

-- vim.api.nvim_set_keymap("n", "<leader>b", "require('bufferline').go_to_buffer(vim.fn.input('Buffer: '))<CR>", { noremap = true, silent = true })
