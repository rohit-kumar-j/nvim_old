require("cmake-tools").setup({
  cmake_command = "cmake",
  cmake_build_directory = "build",
  cmake_build_directory_prefix = "",               -- when cmake_build_directory is "", this option will be activated
  cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_regenerate_on_save = true,                 -- Saves CMakeLists.txt file only if mofified.
  cmake_launch_from_built_binary_directory = true, -- WIP: see #47 and #34
  cmake_soft_link_compile_commands = true,         -- if softlink compile commands json file
  cmake_build_options = {},
  cmake_console_size = 10,                         -- cmake output window height
  cmake_console_position = "belowright",           -- "belowright", "aboveleft", ...
  cmake_show_console = "always",                   -- "always", "only_on_error"
  cmake_dap_configuration = {
    name = "cpp",
    type = "codelldb",
    request = "launch", -- dap configuration, optional
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal"
  },
  cmake_variants_message = {
    short = { show = true },
    long = { show = true, max_length = 40 }
  },

  cmake_use_terminal_for_build = true,
  cmake_unify_terminal_for_launch = true,
  cmake_terminal_opts = {
    split_direction = "horizontal", -- "horizontal", "vertical"
    split_size = 11,
    main_terminal_name = "Main Terminal",
    prefix_for_all_cmake_terminals = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name

    -- Window handling
    display_single_terminal_window_arcoss_instance = true, -- Single viewport, multiple windows
    single_terminal_window_per_tab = true,                 -- Single viewport per tab
    keep_terminal_window_in_static_location = true,        -- Static location of the viewport if avialable

    -- Running Taaks
    launch_task_in_a_child_process = false, -- Set this to true to make sure that you do not execute multiple cmake tasks at-a-time and keep sending data to the terminal
    launch_executable_in_a_child_process = false,
    startinsert_in_launch_task = true,
    startinsert_in_other_tasks = false,
    -- launch_executable_from_build_directory = true -- This option is currently invalid.
    -- We launch from build directory by default.
    -- We can give the users the option to launch from the project source directory if they need to use some resources from the projecy source dir instead of '-E copy_if_different' POST_BUILD command
    -- But as of now, not sure
  }
})

-- require("cmake-tools").setup({})
