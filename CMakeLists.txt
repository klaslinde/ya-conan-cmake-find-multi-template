cmake_minimum_required(VERSION 3.0)
project(Template VERSION 1.0)

# set up settings
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED true)

# set up conan 
list(APPEND CONAN_PATH ${CMAKE_CURRENT_LIST_DIR}/conan)
list(APPEND CMAKE_MODULE_PATH ${CONAN_PATH})
list(APPEND CMAKE_PREFIX_PATH ${CONAN_PATH})

# include dirs
add_subdirectory(source)

