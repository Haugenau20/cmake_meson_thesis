add_library(c_lib STATIC)
target_sources(c_lib PRIVATE
    a.c
    b.c
    c.c
    d.c
	e.c
)

target_link_options(c_lib PUBLIC "-nostartfiles")
target_link_libraries(c_lib PRIVATE architecture_specific)
target_include_directories(c_lib PUBLIC ${PROJECT_SOURCE_DIR}/lib)

add_library(new_c_lib STATIC)
target_sources(new_c_lib PRIVATE
    f.c
    g.c
    h.c
    i.c
    j.c
)

target_link_options(new_c_lib PUBLIC "-nostartfiles")
target_link_libraries(new_c_lib PRIVATE architecture_specific)
target_include_directories(new_c_lib PUBLIC ${PROJECT_SOURCE_DIR}/lib)