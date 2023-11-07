cmake_minimum_required(VERSION 3.17)
project(CMake_quality_test
	VERSION 1.0
	DESCRIPTION "A project"
	LANGUAGES C
)

set(CMAKE_BUILD_PARALLEL_LEVEL 8)

# Set build tyoe to Debug (-g)
set(CMAKE_BUILD_TYPE Debug)

# Include override function of "add_executable", to create link script dependency
include(cmake/AddExecutableWithLinkerScriptDep.cmake)
# Include custom convertion functions
include(cmake/Conversions.cmake)
# Run CMakeLists.txt in src/
add_subdirectory(src)

# Add exeuctable and specify sources and lib links.
add_executable(sample_app)
target_sources(sample_app PRIVATE ${CMAKE_SOURCE_DIR}/src/main.c)
target_link_libraries(sample_app PRIVATE
	c_lib
	new_c_lib	
)

# Custom functions to create memory map
target_linker_map(sample_app)

# Custom function to convert from ELF to .hex and .bin
convert_to_hex(sample_app)
convert_to_bin(sample_app)
