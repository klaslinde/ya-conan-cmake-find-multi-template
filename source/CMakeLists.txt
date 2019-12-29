project(main)

find_package(spdlog REQUIRED)
find_package(fmt REQUIRED)
find_package(eastl REQUIRED)

add_executable(main main.cpp)
set_target_properties(main PROPERTIES 
	MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

target_link_libraries(main
	PRIVATE project_options project_warnings fmt::fmt
	PUBLIC spdlog::spdlog)
