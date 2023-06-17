local is_macunix = vim.fn.has("macunix")
local is_win32 = vim.fn.has("win32")
local is_wsl = vim.fn.has("wsl")

local notes_folder = "nvim_workbench_notes"
-- print(os.getenv("USERPROFILE"))
if (is_macunix == 1) then
  vim.g.workbench_storage_path = "~/.config/" .. notes_folder
end
if (is_win32 == 1) then
  vim.g.workbench_storage_path = os.getenv("USERPROFILE") .. "/AppData/Local/" .. notes_folder
end
if (is_wsl == 1) then
  vim.g.workbench_storage_path = "~/.config/" .. notes_folder
end
vim.g.workbench_border = 'single'

vim.api.nvim_set_keymap('n', "<leader><leader>p", "<cmd>lua require('workbench').toggle_project_workbench()<CR>",
  { noremap = true, silent = true, desc = "Toggle Project Workbench" })
vim.api.nvim_set_keymap('n', "<leader><leader>b", "<cmd>lua require('workbench').toggle_branch_workbench()<CR>",
  { noremap = true, silent = true, desc = "Toggle Branch Workbench" })
vim.api.nvim_set_keymap('n', "<leader><leader>a", "<Plug>WorkbenchAddCheckbox<CR>",
  { noremap = true, silent = true, desc = "Add CheckBox" })
vim.api.nvim_set_keymap('n', "<leader><leader>t", "<Plug>WorkbenchToggleCheckbox<CR>",
  { noremap = true, silent = true, desc = "Toggle CheckBox" })
