cmake_minimum_required(VERSION 3.8)
project(coretran LANGUAGES Fortran)

# Optional parameters to use
# -DCMAKE_Fortran_COMPILER=/path/to/fortran/compiler
# -DCMAKE_BUILD_TYPE=[DEBUG, RELEASE]  - Build with debug flags or not.
# -DSTATIC=[ON, OFF]  - Build and shared or static library, or link a program using -static

# Add our local modules to the module path
if(NOT CMAKE_MODULE_PATH)
  set(CMAKE_MODULE_PATH)
endif()
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../myCMakeFiles")

# GNUInstallDirs is used to install libraries into correct locations
# on all platforms.
include(GNUInstallDirs)

# Setup the Fortran cmake environment
# Sets up the flags for compiling shared libraries or static libraries, and returns the libType parameter.
include("${CMAKE_MODULE_PATH}/FortranEnvironment.cmake")

# Create the library
# ${PROJECT_NAME} is the name given for the most recent project() call
add_library(${PROJECT_NAME} "")

# Add files to the library as sources
# Each CMakeLists.txt simply uses target_sources to add the source files
# Core
include(core/CMakeLists.txt)
# Time
include(time/CMakeLists.txt)
# Random Number Generators
include(random/CMakeLists.txt)
# Searching
include(searching/CMakeLists.txt)
# Arrays1D
include(arrays/CMakeLists.txt)
# Sorting
include(sorting/CMakeLists.txt)
# Spatial
include(spatial/CMakeLists.txt)
# Maths
include(maths/CMakeLists.txt)
# Dynamic Arrays
include(dynamicArrays/CMakeLists.txt)

target_include_directories(${PROJECT_NAME} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}> # for generated files in build mode
                                                  $<INSTALL_INTERFACE:include> # for client in install mode
                                                  $<INSTALL_INTERFACE:lib> # for generated files in install mdoe
                                           PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}) # for source files


# 'make install' to the correct locations (provided by GNUInstallDirs).
install(TARGETS ${PROJECT_NAME} EXPORT coretran-config
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    INCLUDES DESTINATION include)

install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ DESTINATION include
    FILES_MATCHING PATTERN "*.mod"
    PATTERN "CMakeFiles" EXCLUDE)

install(EXPORT coretran-config DESTINATION lib/cmake)

export(TARGETS ${PROJECT_NAME} FILE coretran-config.cmake)
#    RUNTIME  DESTINATION ${CMAKE_INSTALL_BINDIR})  # This is for Windows


# Compile the tests
add_subdirectory(${CMAKE_SOURCE_DIR}/tests)

# Thats it! Simple!
