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
add_library(project_warnings INTERFACE)
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_20)

if (MSVC)
	target_compile_options(project_warnings INTERFACE /W4 /WX /permissive-)
else()
	option(ENABLE_ASAN "Address sanitizer" TRUE)
	option(LIBCPP "Use libc++" FALSE)

	if (ENABLE_ASAN)
		target_compile_options(project_options INTERFACE -fsanitize=address)
		target_link_libraries(project_options INTERFACE -fsanitize=address)
	endif(ENABLE_ASAN)
	
	target_compile_options(project_warnings 
		INTERFACE
		-Wall 
		-Werror 
		-Wextra 
		-Wpedantic
		-Wshadow 
		-Wnon-virtual-dtor
		-Wcast-align
		-Wunused
		-Woverloaded-virtual
		-Wconversion
		-Wsign-conversion
		-Wnull-dereference
		-Wdouble-promotion
		-Wformat=2)

	if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
		target_link_libraries(project_options INTERFACE stdc++fs)
	elseif (LIBCPP)
		target_compile_options(project_options INTERFACE -stdlib=libc++)
	else()
		target_link_libraries(project_options INTERFACE stdc++fs)
	endif()
endif(MSVC)

# include dirs
add_subdirectory(source)

