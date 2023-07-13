local vim = vim

function _G.toggle_nvimtree()
    if vim.fn.bufname():match 'NvimTree_' then
        vim.cmd.wincmd 'p'
    else
        -- require('nvim-tree.api').tree.find_file()
        -- require('nvim-tree.api').tree.toggle()
        vim.cmd('NvimTreeFindFile') -- Find currently open file and set Focus
        vim.cmd('NvimTreeFocus')    -- Focus on the Opened tree
    end
end

local is_macunix = vim.fn.has('macunix')
local is_win32 = vim.fn.has('win32')
local is_wsl = vim.fn.has('wsl')
local is_linux = vim.fn.has('linux')

local conf_dir
if (is_macunix == 1) then
    conf_dir = os.getenv('HOME') .. "/.config/nvim"
elseif
    (is_win32 == 1) then
    conf_dir = os.getenv('HOME') .. "/AppData/Local/nvim"
elseif
    (is_wsl == 1 or is_linux == 1) then
    conf_dir = os.getenv('HOME') .. "/.config/nvim"
end

-- print("Conf dir : " .. conf_dir)

function _G.searchDir() --dir_path)
    require('telescope.builtin').find_files {
        border = true,
        cwd = conf_dir
    }
end

vim.cmd("command! -nargs=1 SearchDir lua searchDir(<f-args>)")

-- :lua require('nvim-tree.api').tree.toggle(false, true)

local wk = require("which-key")
local mappings = {
    w     = { "<cmd>w<CR>", "Save" },                                                              -- DONE
    q     = { "<cmd>q<CR>", "Quit" },                                                              -- DONE
    Q     = { "<cmd>wq<CR>", "Save & Quit" },                                                      -- DONE
    x     = { "<cmd>close<CR>", "Close" },                                                         -- DONE
    e     = { "<cmd>lua toggle_nvimtree()<CR>", "Explorer Toggle" },                               -- DONE
    r     = { "<cmd>lua require('nvim-tree.api').tree.toggle(false, true)<CR>", "Explorer Peek" }, -- DONE
    f     = { "<cmd>Telescope find_files<CR>", "Telescope Find Files" },                           -- DONE
    C     = { "<cmd>lua searchDir()<CR>", "Telescope Find Config Files" },                         -- DONE
    [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },                                                 -- DONE
    W     = { "<cmd>lua require('wrapping').toggle_wrap_mode()<CR>", "Toggle Line Wrap" },         -- DONE
    h     = {
        name = "Harpoon",
        a    = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add file to Harpoon" },
        s    = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle Harpoon Menu" },
        n    = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next Harpoon mark" },
        p    = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous Harpoon mark" },
    },
    c     = {
        -- Symbol : CMake
        name = "CMake",
        g = { "<cmd>CMakeGenerate<cr>", "CMake Generate" },
        b = { "<cmd>CMakeBuild<cr>", "CMake Build" },
        r = { "<cmd>CMakeRun<cr>", "CMake Run" },
        d = { "<cmd>CMakeDebug<cr>", "CMake Debug" },
        O = { "<cmd>CMakeOpen<cr>", "CMake Open Console" },
        m = { "<cmd>CPPMan<cr>", "Cpp Manual Pages" },
        C = { "<cmd>CMakeClose<cr>", "CMake Close Console" },
        l = { "<cmd>CMakeSelectLaunchTarget<cr>", "Select Launch Target" },
        i = { "<cmd>CMakeInstall<cr>", "CMake Install" },
        c = { "<cmd>CMakeClean<cr>", "CMake Clean" },
        t = { "<cmd>CMakeSelectBuildTarget<cr>", "Select Build Target" },
        s = { "<cmd>CMakeStop<cr>", "CMake Stop" },
        S = {
            name = "Select",
            b = { "<cmd>CMakeSelectBuildType<cr>", "Select BuildType" },
            l = { "<cmd>CMakeSelectLaunchTarget<cr>", "Select LaunchTarget" },
            k = { "<cmd>CMakeSelectKit<cr>", "Select Kit" },
            c = { "<cmd>CMakeSelectConfigurePreset<cr>", "Select ConfigurePreset" },
            p = { "<cmd>CMakeSelectBuildPreset<cr>", "Select BuildPreset" },
        },
    },
    t     = {
        -- Symbol : Telescope
        name = "Telescope/Tab ctrl",
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },                           -- DONE
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },                             -- DONE
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },                                 -- DONE
        r = { "<cmd>Telescope resume<cr>", "Resume" },                                   -- DONE
        t = { "<cmd>TodoTelescope<cr>", "TODO List" },                                   -- DONE
        h = { "<cmd>Telescope help_tags<cr>", "Help tags" },                             -- DONE
        c = { "<cmd>Telescope colorscheme preview=true<cr>", "Color Scheme Preview" },   -- DONE
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },           -- DONE
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" }, -- DONE
        a = { "<cmd>tabnew<cr>", "New Tab" },                                            -- DONE
        d = { "<cmd>tabclose<cr>", "Close Tab" },                                        -- DONE
    },
    g     = {
        -- Symbol : Git
        name = "Git",
        g = { "<cmd>LazyGit<cr>", "Lazygit" },
        j = { "<cmd>lua require ('gitsigns').next_hunk({navigation_message = false})<cr>", "Next Hunk" },
        k = { "<cmd>lua require ('gitsigns').prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
        l = { "<cmd>lua require ('gitsigns').blame_line()<cr>", "Blame" },
        P = { "<cmd>lua require ('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
        p = {
            name = "Goto-Preview",
            d = { "<cmd> lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
            t = { "<cmd> lua require('goto-preview').goto_preview_type_definition()<CR>", "Type Definition" },
            i = { "<cmd> lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
            r = { "<cmd> lua require('goto-preview').goto_preview_references()<CR>", "References" },
        },
        r = { "<cmd>lua require ('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require ('gitsigns').reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require ('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require ('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        C = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        A = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current branch)" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
    },
    d     = {
        -- Symbol : Debug
        name = "Debug",
        t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        b = { "<cmd>lua require('dap').step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
        C = { "<cmd>lua require('dap').run_to_cursor()<cr>", "Run To Cursor" },
        D = { "<cmd>lua require('dap').disconnect()<cr>", "Disconnect" },
        g = { "<cmd>lua require('dap').session()<cr>", "Get Session" },
        i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
        u = { "<cmd>lua require('dap').step_out()<cr>", "Step Out" },
        L = { "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
            "Log Point Message" },
        p = { "<cmd>lua require('dap').pause()<cr>", "Pause" },
        r = { "<cmd>lua require('dap').repl.toggle()<cr>", "Toggle Repl" },
        l = { "<cmd>lua require('dap').run_last()<cr>", "Toggle Repl" },
        s = { "<cmd>lua require('dap').continue()<cr>", "Start" },
        q = { "<cmd>lua require('dap').close()<cr>", "Quit" },
        U = { "<cmd>lua require('dapui').toggle({reset = true})<cr>", "Toggle UI" },
        -- w = {
        --   -- Widgets
        --   name = "Widgets",
        --   p = { "<cmd>lua require('dap.ui.widgets').preview()<cr>", "Preview Widgets" },
        --   f = { "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<cr>", "Frame Widget" },
        --   p = { "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)<cr>", "Scope Widget" },
        -- }
    },
    l     = {
        -- Symbol : LSP
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        i = { "<cmd>LspInfo<cr>", "Lsp Info" },
        m = { "<cmd>Mason<cr>", "Mason Info" },
        k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
        w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
        W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
        L = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folders" },
        c = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
        r = { "<cmd>lua vim.lsp.buf.references(vim.diagnostic.goto_next())<cr>", "References" },
        R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
        E = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Buffer Diagnostics" },
        n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        N = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    },
    -- l = { -- Symbol : LSP
    --     name = "LSP",
    --     d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",       "Buffer Diagnostics"    },
    --     w = { "<cmd>Telescope diagnostics<cr>",                             "Diagnostics"           },
    -- },

    z     = {
        -- Symbol : Zen Mode
        name = "Focus Mode",
        z = { "<cmd>ZenMode<CR>", "Zen Mode" },
        t = { "<cmd>Twilight<CR>", "Toggle Twilight" },
    },
    P     = {
        -- Symbol : Lazy
        name = "Lazy",
        i = { "<cmd>Lazy install<cr>", "Install" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        S = { "<cmd>Lazy clear<cr>", "Status" },
        c = { "<cmd>Lazy clean<cr>", "Clean" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        p = { "<cmd>Lazy profile<cr>", "Profile" },
        l = { "<cmd>Lazy log<cr>", "Log" },
        d = { "<cmd>Lazy debug<cr>", "Debug" },
    },
    b     = {
        -- Symbol : Buffers
        name = "Buffers",
        j = { "<cmd>BufferLinePick<cr>", "Jump" },
        d = { "<cmd>bdelete<cr>", "Buffer Delete" },
        f = { "<cmd>Telescope buffers<cr>", "Open buffers" },
        b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
        w = { "<cmd>bwipeout!<cr>", "Wipeout" },
        e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
        h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
        l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
        D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
        L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
    },
}

local opts = { prefix = '<leader>' }

wk.register(mappings, opts)
