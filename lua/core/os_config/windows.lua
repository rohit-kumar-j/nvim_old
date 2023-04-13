-- Win32
--
-- Multi/Single clipboard copy
if (vim.api.nvim_get_var("copy_to_single_clipboard") == true) then
    vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end
