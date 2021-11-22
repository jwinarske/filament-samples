cmake_minimum_required(VERSION 3.19)
project(sdl2 C)

if (FILAMENT_SKIP_SDL2)
    return()
endif()

find_package(SDL2 REQUIRED)

###################################################################################################

# include directories...
include_directories(
    ${SDL2_INCLUDE_DIRS}
)
