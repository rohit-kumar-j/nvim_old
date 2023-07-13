require("zen-mode").setup({
    kitty = {
        enabled = false,
        font = "+4", -- font size increment
    },


    plugins = {
        twilight = { enabled = false },
    },
    window = {
        width = .75, -- width will be 85% of the editor width
        options = {
            -- signcolumn = "no", -- disable signcolumn
            number = false,         -- disable number column
            relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
        },
    }
})
