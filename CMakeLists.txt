cmake_minimum_required(VERSION 3.19)

if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.12")
    cmake_policy(SET CMP0074 NEW)
endif()

project(TNT LANGUAGES C CXX ASM)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

add_compile_definitions(_GETOPT_POSIX_H)

# ==================================================================================================
#  Paths
# ==================================================================================================
# Where our external libs are
set(EXTERNAL ${CMAKE_CURRENT_SOURCE_DIR}/third_party)

# Where our libraries are
set(LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/libs)

# Where our filament code is
if (NOT FILAMENT)
    set(FILAMENT ${CMAKE_CURRENT_SOURCE_DIR})
endif()

# Where our tools are
set(TOOLS ${FILAMENT_HOST_TOOLS_ROOT})

# ==================================================================================================
# Application specific
# ==================================================================================================

include(filament-app)

# ==================================================================================================
# Libraries
# ==================================================================================================

# include_directories (${FILAMENT}/usr/include)

add_subdirectory (third_party/etc2comp)
add_subdirectory (third_party/astcenc/tnt)
add_subdirectory (third_party/robin-map/tnt)
add_subdirectory (third_party/stb/tnt)
add_subdirectory (third_party/tinyexr/tnt)
add_subdirectory (third_party/cgltf/tnt)
add_subdirectory (third_party/hat-trie/tnt)
add_subdirectory (third_party/draco/tnt)
add_subdirectory (third_party/civetweb/tnt)
add_subdirectory (third_party/jsmn/tnt)
add_subdirectory (third_party/imgui/tnt)
add_subdirectory (third_party/libsdl2/tnt)
# add_subdirectory (third_party/libassimp/tnt)
add_subdirectory (third_party/benchmark/tnt)
add_subdirectory (third_party/getopt)

add_subdirectory (libs/filamentapp)
add_subdirectory (libs/image)
add_subdirectory (libs/imageio)
add_subdirectory (libs/gltfio)
add_subdirectory (libs/math)
add_subdirectory (libs/utils)
add_subdirectory (libs/camutils)
add_subdirectory (libs/viewer)
add_subdirectory (libs/filagui)

# ==================================================================================================
# Applications
# ==================================================================================================
add_subdirectory (samples)
