local vim = vim
local lsp_servers = vim.api.nvim_get_var('lsp_servers')

-- Convert lsp_servers to a table of strings
local server_names = {}
for _, server in ipairs(lsp_servers) do
    table.insert(server_names, server.name)
end

-- Set up mason-lspconfig
require('mason').setup(
    {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
    }
)
require('mason-lspconfig').setup({
    ensure_installed = server_names,
})

-- LINTERS | FORMATTERS | DAP
local lsp_linters = vim.api.nvim_get_var('lsp_linters')
local lsp_dap = vim.api.nvim_get_var('lsp_dap')
local lsp_formatters = vim.api.nvim_get_var('lsp_formatters')
local all_lsp_tools = {}
for _, lsp_tool in ipairs(lsp_linters) do
    table.insert(all_lsp_tools, lsp_tool)
end
for _, lsp_tool in ipairs(lsp_dap) do
    table.insert(all_lsp_tools, lsp_tool)
end
for _, lsp_tool in ipairs(lsp_formatters) do
    table.insert(all_lsp_tools, lsp_tool)
end

require('mason-tool-installer').setup(
    {
        ensure_installed = all_lsp_tools
    }
)

-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
    -- "╭", "─", "╮", "│", "╯", "─", "╰", "│"
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}
-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts)
end

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- See :help vim.diagnostic.config for more advanced customization options.
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

-- LINTERS | FORMATTERS | DAP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- LSP SETUP
local on_attach = function(client, bufnr)
    -- Using default Keymaps
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end

for _, lsp in ipairs(lsp_servers) do
    require('lspconfig')[lsp.name].setup {
        settings = lsp_servers[lsp.settings],
        on_attach = on_attach,
        on_new_config = lsp_servers[lsp.on_new_config],
        capabilities = capabilities,
        handlers = handlers,
    }
end

-- vim.lsp.handlers['textDocument/hover'] = function(_, method, result)
--     vim.lsp.util.focusable_float(method, function()
--         if not (result and result.contents) then
--             -- return { 'No information available' }
--             return
--         end
--         local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
--         markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
--         if vim.tbl_isempty(markdown_lines) then
--             -- return { 'No information available' }
--             return
--         end
--         local bufnr, winnr = vim.lsp.util.fancy_floating_markdown(markdown_lines, {
--             pad_left = 1, pad_right = 1,
--         })
--         vim.lsp.util.close_preview_autocmd({ "CursorMoved", "BufHidden" }, winnr)
--         return bufnr, winnr
--     end)
-- end
--
--
-- M.icons = {
--     Class = " ",
--     Color = " ",
--     Constant = " ",
--     Constructor = " ",
--     Enum = "了 ",
--     EnumMember = " ",
--     Field = " ",
--     File = " ",
--     Folder = " ",
--     Function = " ",
--     Interface = "ﰮ ",
--     Keyword = " ",
--     Method = "ƒ ",
--     Module = " ",
--     Property = " ",
--     Snippet = "﬌ ",
--     Struct = " ",
--     Text = " ",
--     Unit = " ",
--     Value = " ",
--     Variable = " ",
-- }
