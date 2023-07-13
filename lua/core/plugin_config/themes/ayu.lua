local user_ayu = {}
--- Example visual select colors
--  make sure you set vim.o.backgorund='light' in your init.lua
function user_ayu.get_visual_bg()
    if vim.o.background == 'dark' then
        return { bg = '#333333' }
    else
        return { bg = '#000000' }
    end
end

require('ayu').setup({

    -- overrides = {
    --     LineNr = { fg = '#717171'}
    -- },

    overrides = {
        Normal = { bg = "None" },
        NormalFloat = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = {
            bg = "None",
            -- bg = "#333333",
        },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        Visual = user_ayu.get_visual_bg(),
        LineNr = { fg = '#d3d3d3' }, -- This is for trnasparency
        WhichKeyFloat = { bg = "None" },
        VertSplit = { bg = "None" },
    },
})
