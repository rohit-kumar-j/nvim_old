local is_win32 = vim.fn.has("win32")
if (is_win32 == 1) then
    local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
    }

    for option, value in pairs(powershell_options) do
        vim.opt[option] = value
    end
end


require("toggleterm").setup({
    -- on_create = function (require'toggleterm'.exec("cls") end),
    -- on_create = function() require 'toggleterm'.exec() end,
    open_mapping = [[<c-\>]],
    direction = 'float',
    size = 40,
    float_opts = {
        border = "double",
    },
})
