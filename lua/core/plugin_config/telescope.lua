vim.api.nvim_create_autocmd({ 'WinLeave' }, {
  group = vim.api.nvim_create_augroup('Folds', { clear = true }),
  pattern = "*",
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = "bottom",
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = " ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    normal_mode = true,
  },
  pickers = {
    planets = {
      show_pluto = true,
      show_moon = true,
      show_earth = true,
      show_mars = true,
      show_jupiter = true,
      show_neptune = true,
      show_saturn = true,
      show_uranus = true,
      show_venus = true,
      show_mercury = true,
    },
    colorscheme = {
      enable_preview = true,
    },
    buffers = {
      initial_mode = "normal"
    },
  }
}

extensions = {
  ["ui-select"] = {
    require("telescope.themes").get_dropdown {
      -- even more opts
      width = 0.8,
      previewer = false,
      prompt_title = false,
      borderchars = {
        { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      },
    }
  },
}
require('telescope').load_extension("ui-select")
require('telescope').load_extension('dap')
