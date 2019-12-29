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

