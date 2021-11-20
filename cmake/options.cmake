
option(FILAMENT_SUPPORTS_XCB "Include XCB support in Linux builds" OFF)

option(FILAMENT_SUPPORTS_XLIB "Include XLIB support in Linux builds" OFF)

option(FILAMENT_SUPPORTS_WAYLAND "Include Wayland support in Linux builds" ON)

set(FILAMENT_NDK_VERSION "" CACHE STRING
    "Android NDK version or version prefix to be used when building for Android."
)

set(FILAMENT_PER_RENDER_PASS_ARENA_SIZE_IN_MB "2" CACHE STRING
    "Per render pass arena size. Must be roughly 1 MB larger than FILAMENT_PER_FRAME_COMMANDS_SIZE_IN_MB, default 2."
)

set(FILAMENT_PER_FRAME_COMMANDS_SIZE_IN_MB "1" CACHE STRING
    "Size of the high-level draw commands buffer. Rule of thumb, 1 MB less than FILAMENT_PER_RENDER_PASS_ARENA_SIZE_IN_MB, default 1."
)

set(FILAMENT_MIN_COMMAND_BUFFERS_SIZE_IN_MB "1" CACHE STRING
    "Size of the command-stream buffer. As a rule of thumb use the same value as FILAMENT_PER_FRRAME_COMMANDS_SIZE_IN_MB, default 1."
)

set(FILAMENT_OPENGL_HANDLE_ARENA_SIZE_IN_MB "4" CACHE STRING
    "Size of the OpenGL handle arena, default 4."
)

set(FILAMENT_METAL_HANDLE_ARENA_SIZE_IN_MB "8" CACHE STRING
    "Size of the Metal handle arena, default 8."
)
