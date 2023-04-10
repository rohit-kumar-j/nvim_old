vim.opt.termguicolors = true
require("bufferline").setup {
	options = {
		separator_style = "slant",
	},
}

-- vim.api.nvim_set_keymap("n", "<leader>b", "require('bufferline').go_to_buffer(vim.fn.input('Buffer: '))<CR>", { noremap = true, silent = true })
