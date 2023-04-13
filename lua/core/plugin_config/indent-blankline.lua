require("indent_blankline").setup({
    viewport_buffer = 100,
    char = "▏",
    context_char = "▏",
    filetype_exclude = {
        -- ...
    },
    context_highlight_list = {
        -- ...
    },
    context_start_highlight_list = {
        -- ...
    },
    space_char_blankline = " ",
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    show_foldtext = false,
    strict_tabs = true,
    --    max_indent_increase = 1,
})
