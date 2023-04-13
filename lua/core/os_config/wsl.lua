-- WSL
--
-- Multi/Single clipboard copy
if (vim.api.nvim_get_var("copy_to_single_clipboard") == true) then
    vim.cmd [[
	augroup Yank
	autocmd!
	autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
	augroup END
	]]
end
