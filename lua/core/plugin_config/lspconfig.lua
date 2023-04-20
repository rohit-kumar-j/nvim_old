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
-- LINTERS | FORMATTERS | DAP

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- LSP SETUP
local on_attach = function(client, bufnr)
    -- Using default Keymaps
end

for _, lsp in ipairs(lsp_servers) do
    require('lspconfig')[lsp.name].setup {
        settings = lsp_servers[lsp.settings],
        on_attach = on_attach,
        capabilities = capabilities
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
