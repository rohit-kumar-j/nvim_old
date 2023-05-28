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
  cmake_use_terminals = true,
  cmake_terminal_opts = {
    split_direction = "horizontal",   -- "horizontal", "vertical"
    split_size = 16,
    main_terminal_name = "My Second Little Pony CMake Terminal",
    display_single_terminal_arcoss_instance = true,
    single_terminal_pet_tab = true,
    keep_terminal_in_static_location = true,
  }

})

-- require("cmake-tools").setup({})
