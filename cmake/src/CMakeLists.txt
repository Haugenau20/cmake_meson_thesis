add_library(mylib STATIC)
target_sources(mylib PRIVATE
    a.c
    b.c
    c.c
    d.c
	e.c
)

target_link_options(mylib PUBLIC "-nostartfiles")
target_link_libraries(mylib PUBLIC architecture_specific)
target_include_directories(mylib PUBLIC ${PROJECT_SOURCE_DIR}/lib)

add_library(new_mylib STATIC)
target_sources(new_mylib PRIVATE
    f.c
    g.c
    h.c
    i.c
    j.c
)

target_link_options(new_mylib PUBLIC "-nostartfiles")
target_link_libraries(new_mylib PUBLIC architecture_specific)
target_include_directories(new_mylib PUBLIC ${PROJECT_SOURCE_DIR}/lib)