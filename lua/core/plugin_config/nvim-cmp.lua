local vim                     = vim
local lspkind                 = require('lspkind')

local cmp                     = require('cmp')
local types                   = require("cmp.types")
local str                     = require("cmp.utils.str")

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end


cmp.setup({
    completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
    window = {
        documentation = cmp.config.window.bordered(),
        -- documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
        completion = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c" }
        ),
        ["<C-j>"] = cmp.mapping(
            cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            { "i", "s", "c" }
        ),
        ["<C-k>"] = cmp.mapping(
            cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            { "i", "s", "c" }
        ),
        ["<c-space>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            { "i", "c" }
        ),

        -- Super Tabs!! If there are args of functions, then we can jump between them to insert args!
        ["<C-N>"] = cmp.mapping(function(fallback) -- ["<Tab>"]
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<C-P>"] = cmp.mapping(function(fallback) -- ["<S-Tab>"]
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
            elseif neogen.jumpable() then
                vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'lua_snip' },
        { name = 'friendly-snippets' },
        { name = 'nvim_lua' },
        { name = 'buffer',           keyword_length = 3 }, -- max_item_count = 5 }
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    --[[formatting = {
        fields = {
            cmp.ItemField.Kind,
            cmp.ItemField.Abbr,
            cmp.ItemField.Menu,
        },
        format = lspkind.cmp_format({
            with_text = false,
            before = function(entry, vim_item)
                -- Get the full snippet (and only keep first line)
                local word = entry:get_insert_text()
                if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                    word = vim.lsp.util.parse_snippet(word)
                end
                word = str.oneline(word)

                -- concatenates the string
                -- local max = 50
                -- if string.len(word) >= max then
                --  local before = string.sub(word, 1, math.floor((max - 3) / 2))
                --  word = before .. "..."
                -- end

                if
                    entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
                    and string.sub(vim_item.abbr, -1, -1) == "~"
                then
                    word = word .. "~"
                end
                vim_item.abbr = word

                return vim_item
            end,
        }),
    },]]
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
    formatting = {
        format = lspkind.cmp_format {
            -- with_text = true,
            -- mode      = 'symbol', -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function (entry, vim_item)
            --   ...
            --   return vim_item
            -- end
        }
    }
})
