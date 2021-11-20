cmake_minimum_required(VERSION 3.19)

if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.12")
    cmake_policy(SET CMP0074 NEW)
endif()

project(TNT LANGUAGES C CXX ASM)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

# ==================================================================================================
#  Paths
# ==================================================================================================
# Where our external libs are
set(EXTERNAL ${CMAKE_CURRENT_SOURCE_DIR}/third_party)

# Where our libraries are
set(LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/libs)

# Where our filament code is
set(FILAMENT ${CMAKE_CURRENT_SOURCE_DIR})

# Where our tools are
set(TOOLS ${FILAMENT_HOST_TOOLS_ROOT})

# ==================================================================================================
# Application specific
# ==================================================================================================

include(filament-app)

# ==================================================================================================
# Distribution
# ==================================================================================================
# set(DIST_DIR "")
# set(DIST_ARCH "")

# choose where to put the objects in the dist folder
if (NOT DIST_ARCH)
    # On Apple silicon, the value of CMAKE_HOST_SYSTEM_PROCESSOR varies based on the CMake process's
    # own architecture. Because of this, running a x86_64 CMake binary on Apple silicon will cause
    # DIST_ARCH to be set incorrectly.
    set(DIST_ARCH "${CMAKE_HOST_SYSTEM_PROCESSOR}")

    if (CMAKE_OSX_ARCHITECTURES MATCHES ".*;.*")
        set(DIST_ARCH "universal")
    else()
        if (NOT "${CMAKE_OSX_ARCHITECTURES}" STREQUAL "")
            set(DIST_ARCH "${CMAKE_OSX_ARCHITECTURES}")
        endif()
    endif()

endif()
# On Windows machines, the host processor is set to 'AMD64', which we'll interpret as x86_64.
string(TOLOWER "${DIST_ARCH}" DIST_ARCH)
string(REPLACE "amd64" "x86_64" DIST_ARCH "${DIST_ARCH}")
if (NOT DIST_DIR)
    set(DIST_DIR "${DIST_ARCH}")
endif()

# ==================================================================================================
# Libraries
# ==================================================================================================

add_subdirectory (third_party/astcenc/tnt)
include_directories (
    third_party/etc2comp/EtcLib/Etc
    third_party/etc2comp/EtcLib/EtcCodec
    )
add_subdirectory (third_party/robin-map/tnt)
add_subdirectory (third_party/stb/tnt)
add_subdirectory (third_party/tinyexr/tnt)

include_directories(libs/math/include)

add_subdirectory (libs/filamentapp)
add_subdirectory (libs/image)
add_subdirectory (libs/imageio)
add_subdirectory (libs/gltfio)
add_subdirectory (libs/utils)
add_subdirectory (libs/camutils)
add_subdirectory (libs/viewer)

# ==================================================================================================
# Applications
# ==================================================================================================
# add_subdirectory (samples)
