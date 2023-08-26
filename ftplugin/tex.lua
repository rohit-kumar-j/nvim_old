vim.cmd([[
nmap <buffer> ,p :LatexPreviewToggle<CR>
nmap <buffer> ,[ :PrevLatexPreviewMode<CR>
nmap <buffer> ,] :NextLatexPreviewMode<CR>

function! ZathuraHook() dict abort
  if self.xwin_id <= 0 | return | endif

  silent call system('xdotool windowactivate ' . self.xwin_id . ' --sync')
  silent call system('xdotool windowraise ' . self.xwin_id)
endfunction
]])

local is_macunix = vim.fn.has("macunix")
local is_win32 = vim.fn.has("win32")
local is_wsl = vim.fn.has("wsl")

if (is_macunix == 1) then
    vim.g.vimtex_view_general_viewer = "ZathuraHook"
end
if (is_win32 == 1) then
    vim.g.vimtex_view_general_viewer = "SumatraPDF"
    vim.g.vimtex_view_general_options = [[-reuse-instance -forward-search @tex @line @pdf]]
end
if (is_wsl == 1) then
    vim.g.vimtex_view_general_viewer = "ZathuraHook"
end
