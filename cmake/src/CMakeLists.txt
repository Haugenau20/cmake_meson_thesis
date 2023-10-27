# Add library and sources
add_library(c_lib STATIC)
target_sources(c_lib PRIVATE
    a.c
    b.c
    c.c
    d.c
	e.c
)

# Add link option -nostartfiles to not include standard startup files
target_link_options(c_lib PUBLIC "-nostartfiles")
# specify include path for header files
target_include_directories(c_lib PUBLIC ${PROJECT_SOURCE_DIR}/lib)

# Add library and sources
add_library(new_c_lib STATIC)
target_sources(new_c_lib PRIVATE
    f.c
    g.c
    h.c
    i.c
    j.c
)

# Add link option -nostartfiles to not include standard startup files
target_link_options(new_c_lib PUBLIC "-nostartfiles")
# specify include path for header files
target_include_directories(new_c_lib PUBLIC ${PROJECT_SOURCE_DIR}/lib)