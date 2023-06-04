require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  color_overrides = {
    mocha = {
      base = "#000000",
      -- mantle = "#242424",
      -- crust = "#474747",
    },
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
  },
  integrations = {
    nvimtree = true,
    which_key = true,
    leap = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
})

-- All Float windos are black
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#000000]])
