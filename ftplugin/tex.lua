vim.cmd([[
nmap <buffer> ,p :LatexPreviewToggle<CR>
nmap <buffer> ,[ :PrevLatexPreviewMode<CR>
nmap <buffer> ,] :NextLatexPreviewMode<CR>

function! ZathuraHook() dict abort
  if self.xwin_id <= 0 | return | endif

  silent call system('xdotool windowactivate ' . self.xwin_id . ' --sync')
  silent call system('xdotool windowraise ' . self.xwin_id)
endfunction

let g:vimtex_view_general_viewer= 'ZathuraHook'
]])
