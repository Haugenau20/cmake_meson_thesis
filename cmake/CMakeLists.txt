cmake_minimum_required(VERSION 3.17)
project(CMake_quality_test
	VERSION 1.0
	DESCRIPTION "A project"
	LANGUAGES C
)

set(CMAKE_BUILD_TYPE Debug)

include(cmake/Conversions.cmake)

add_subdirectory(arch/arm)
add_subdirectory(src)

add_executable(sample_app)
target_sources(sample_app PRIVATE ${CMAKE_SOURCE_DIR}/src/main.c)
target_link_libraries(sample_app PRIVATE
	c_lib
	new_c_lib	
)

target_linker_map(sample_app)
convert_to_hex(sample_app)
convert_to_bin(sample_app)
