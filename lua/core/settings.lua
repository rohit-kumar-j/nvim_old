-- Set <space> as the leader key See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--
local vim = vim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = false })

-- vim.api.nvim_set_keymap('n', '<S-Up>', '<cmd>resize +2<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<S-Down>', '<cmd>resize -2<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-S-Left>', '<cmd>vertical resize +2<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<C-S-Right>', '<cmd>vertical resize -2<CR>', { silent = true })
-- Alternatively:

vim.api.nvim_set_keymap('n', '<C-A-K>', '<cmd>resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-J>', '<cmd>resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-L>', '<cmd>vertical resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-H>', '<cmd>vertical resize -2<CR>', { noremap = true, silent = true })

-- [[ Setting options ]]
-- See `:help vim.o`

-- terminal mode action: revert to normal mode, i,e collapse the buffer
vim.api.nvim_set_keymap("t", "<A-x>", [[<C-\><C-n>]], { silent = true })

-- Set highlight on searc
vim.o.hlsearch = false
vim.o.splitright = true
vim.o.splitbelow = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Enable break indent
vim.o.breakindent = true
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- This is for nvim-ufo
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.cmd([[
-- augroup remember_folds
--   autocmd!
--   autocmd BufWinLeave * mkview
--   autocmd BufWinEnter * silent! loadview
-- augroup END
-- ]])

-- za toggles single folds. Just using zc instead
vim.api.nvim_set_keymap('n', 'zc', 'za', { noremap = true, silent = true })


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.g.mkdp_auto_start = 1
vim.g.mkdp_browser = 'brave' -- markdown preview
vim.g.mkdp_theme = 'light'   -- markdown preview

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- [[ Edit markdown tables on save with pandoc ]]
-- Define the is_markdown function
function is_markdown()
    local extension = vim.fn.expand('%:e')
    return extension == 'md' or extension == 'markdown'
end

-- Define the BufWritePost autocommand
vim.cmd([[
  augroup pandoc
    autocmd!
    autocmd BufWritePost *.md if luaeval("is_markdown()") | silent execute '!pandoc % --lua-filter=html_details -t markdown-simple_tables -o %' | edit | endif
  augroup END
]])

_G.User = {}

User.autoformat = true

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = vim.api.nvim_create_augroup('User_Group', { clear = false }),
    pattern = "*",
    callback = function()
        if User.autoformat == true then
            if vim.o.filetype == 'help' then
                return
            else
                vim.lsp.buf.format()
                print("Formatted buffer and saved!")
            end
        else
            print("Saving file... Auto format disabled!")
            return
        end
    end
})

function _G.toggleAutoformat()
    if User.autoformat == true then
        User.autoformat = not User.autoformat
        print("Disabled format on save")
    else
        User.autoformat = not User.autoformat
        print("Enabled format on save")
    end
end

-- Toggle Format on save
vim.api.nvim_set_keymap('n', '<leader>F', ':lua toggleAutoformat()<CR>',
    { noremap = true, silent = true, desc = "Toggle Format on Save" })
