cmake_minimum_required(VERSION 3.17)
project(CMake_Repeatability_test_LINAK_pc
	VERSION 1.0
	DESCRIPTION "A project"
	LANGUAGES C
)

set(CMAKE_C_STANDARD 11)

include(cmake/Conversions.cmake)

add_subdirectory(arch/arm)
add_subdirectory(src)

add_executable(sample_app)
target_sources(sample_app PRIVATE ${CMAKE_SOURCE_DIR}/src/main.c)
target_link_libraries(sample_app PRIVATE
	mylib
	new_mylib	
)

target_linker_map(sample_app)
convert_to_hex(sample_app)
convert_to_bin(sample_app)
