cmake_minimum_required(VERSION 3.15)
project(Template VERSION 1.0)

# cmake policies 
cmake_policy(SET CMP0092 NEW) # remove /W3 for MSVC
cmake_policy(SET CMP0091 NEW) # MSVC_RUNTIME_LIBRARY

# cmake settings
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED true)

# conan settings
list(APPEND CONAN_PATH ${CMAKE_CURRENT_LIST_DIR}/conan)
list(APPEND CMAKE_MODULE_PATH ${CONAN_PATH})
list(APPEND CMAKE_PREFIX_PATH ${CONAN_PATH})

# compile option targets
include(${CMAKE_CURRENT_LIST_DIR}/cmake/DefaultTargets.cmake)

# include dirs
add_subdirectory(source)

