-- Globals
local vim = vim
vim.api.nvim_set_var('debug', false)                    -- For debugging o/p
vim.api.nvim_set_var('copy_to_single_clipboard', false) -- Copy with y . Only tested to win32 and wsl

-------------------------------------------------
-- Global LSP Servers
vim.api.nvim_set_var('lsp_servers',
  {
    {
      name = 'lua_ls',
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim',
              'require'
            },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = '"${3rd}/luv/library"',
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
          completion = {
            callSnippet = "Replace"
          },
        },
      },
    },
    {
      name          = 'cmake',
      settings      = {
        CMake = {
          filetypes = { 'cmake', 'CMakeLists.txt', 'CMakeCache.txt' },
        },
      },
      on_new_config = function(new_config, new_cwd)
        local status, cmake = pcall(require, "cmake-tools")
        if status then
          cmake.clangd_on_new_config(new_config)
        end
      end,
    },
    {
      name = 'clangd',
      -- cmd = {
      --     "clangd",
      -- },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
      end,
      settings = {
        clangd = {
          extraArgs = {
            -- "-ID:\\VS2022\\Koala\\external",
          }
          --      excludeArgs = { '-stdlib=libc++' }
        },
      },
      on_new_config = function(new_config, new_cwd)
        local status, cmake = pcall(require, "cmake-tools")
        if status then
          cmake.clangd_on_new_config(new_config)
        end
      end,
    },
    {
      name = 'pyright',
    },
    {
      name = 'jsonls', -- for json formatting
    },
    {
      name = 'texlab', -- for latex, lsp
    },
    -- {
    --     name = 'ltex', -- for latex, markdown lsp
    -- },
    {
      name = 'esbonio', -- for reStructuredText lsp
    },
    {
      name = 'lemminx', -- for xml
    }
  }
)

-- Global LSP Linters
vim.api.nvim_set_var('lsp_linters',
  {
    'luacheck', -- lua
    'flake8',   -- python
    'cpplint',  -- C++
    'jsonlint', -- json
    'textlint', -- markdown
    -- No linters for xml
  }
)

-- Global LSP DAP
vim.api.nvim_set_var('lsp_dap',
  {
    'debugpy',  -- python
    'codelldb', -- C++
    'cpptools', -- C++
    -- No dap for json
    -- No dap for markdown
    -- No dap for reStructuredText
    -- No dap for xml
  }
)

-- Global LSP Formatters
vim.api.nvim_set_var('lsp_formatters',
  {
    'stylua',       -- lua
    'black',        -- python
    'clang-format', -- C++, C
    'fixjson',      --json
    'prettierd',    -- markdown
    -- No formatter for reStructuredText
    'xmlformatter'  -- xml
  }
)

-------------------------------------------------
-- Global Treesitter Servers
vim.api.nvim_set_var('treesitter_servers',
  {
    'lua',
    'c',
    'cpp',
    'cmake',
    'norg',
    'latex',
    'bibtex',
    -- No treesitter server for xml
    'vim', -- This solves syntax highlighting in {.lua} files
  }
)

-------------------------------------------------
-- TODO: WhichKey Tests -> LSP:l, BUFFERS:b, DAP:d

-- vim.opt.foldmethod = 'expr'                                 -- Code Folding
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'             -- Code Folding

-- PLUGINS
require('core.os_config')

-- Install plugins
require('core.plugins')
require('core.settings')


-- Call themes first as we diagnostics, and other plugins change transparency of certain windows
require('core.plugin_config.themes.github_theme')
require('core.plugin_config.themes.catppuccin')
-- require('core.plugin_config.themes.rose-pine')
-- require('core.plugin_config.themes.kanagawa')
-- require('core.plugin_config.themes.monokai-pro')
-- require('core.plugin_config.themes.aylin') -- do not require this
-- require('core.plugin_config.themes.kanagawa')
-- require('core.plugin_config.themes.juliana')
-- require('core.plugin_config.themes.nightfox')
-- require('core.plugin_config.themes.onedark')
-- require('core.plugin_config.themes.onedark-pro')
-- require('core.plugin_config.themes.onehalf')


-- call this after all themes are loaded, but not setup yet
require('core.plugin_config.bufferline')

-- vim.cmd.colorscheme('rose-pine')
-- vim.cmd.colorscheme('github_dark_default')
-- vim.cmd.colorscheme('nord')
-- vim.cmd.colorscheme('carbonfox')
vim.cmd.colorscheme('catppuccin-mocha')
-- vim.cmd.colorscheme('tokyonight')
-- vim.cmd.colorscheme('kanagawa')
-- vim.cmd.colorscheme('aylin')
-- vim.cmd.colorscheme('monokai-pro')
-- vim.cmd.colorscheme('onehalfdark')
-- vim.cmd.colorscheme('moonfly')

require('core.plugin_config.nvim-treesitter')
require('core.plugin_config.neodev')
require('core.plugin_config.nvim-tree')
require('core.plugin_config.telescope')
-- require('core.plugin_config.twilight')
require('core.plugin_config.leap')
-- require('core.plugin_config.lazygit')
require('core.plugin_config.gitsigns')
require('core.plugin_config.autopairs')
require('core.plugin_config.nvim-comment')
require('core.plugin_config.lualine')
-- require('core.plugin_config.zen-mode')
require('core.plugin_config.indent-blankline')
require('core.plugin_config.toggleterm')
require('core.plugin_config.fidget')
require('core.plugin_config.comment')
require('core.plugin_config.cmake-tools')
require('core.plugin_config.lspconfig')
require('core.plugin_config.nvim-ufo')
require('core.plugin_config.nvim-cmp')
require('core.plugin_config.dap')
require('core.plugin_config.dap-ui')
-- require('core.plugin_config.dashboard')
-- require('core.plugin_config.glow')
-- require('core.plugin_config.tidy')
-- require('core.plugin_config.neorg')
-- require('core.plugin_config.notify')
require('core.plugin_config.todo-comments')
require('core.plugin_config.harpoon')
-- require('core.plugin_config.popui')

-- Call which key last
require('core.plugin_config.which-key')
-- require('core.plugin_config.markid')

-- for token in string.gmatch(os.getenv('PATH'), '[^;]+') do
-- 	print(token)
-- end
--
--

-- Dashboard -> remove the lines in dashboard
vim.cmd([[
  augroup disableIndentlineDb
   autocmd!
   autocmd VimEnter * :IndentBlanklineDisable
 augroup END
]])

local function getFileList()
  local cwd = vim.loop.cwd()
  local files = {}
  local scan = vim.loop.fs_scandir(cwd)

  if scan then
    while true do
      local name, type = vim.loop.fs_scandir_next(scan)
      if name == nil then
        break
      end

      if type == 'file' then
        table.insert(files, name)
      end
    end
    -- vim.loop.fs_scandir_close(scan)
  end

  return files
end


vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  group = vim.api.nvim_create_augroup('Lazy Load CMake', { clear = true }),
  pattern = "*",
  callback = function()
    local files_in_cwd = getFileList()
    for _, file in ipairs(files_in_cwd) do
      local file = vim.fn.fnamemodify(file, ':t')
      if file == "CMakeLists.txt" then
        require('core.plugin_config.cmake-tools')
      end
    end
  end
})


-- local files = getFileList()
-- for _, file in ipairs(files) do
--   print(vim.fn.fnamemodify(file, ':t'))
-- end
-- local filetype = vim.bo.filetype
-- print(filetype)
