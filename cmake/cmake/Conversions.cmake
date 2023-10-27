# Custom command line function to convert from ELF to hex
function(convert_to_hex TARGET)
    add_custom_command(
    	TARGET ${TARGET} POST_BUILD
    	COMMAND ${CMAKE_OBJCOPY} -O ihex ${TARGET} ${TARGET}.hex
    	BYPRODUCTS ${TARGET}.hex
    )
endfunction()

# Custom command line function to convert from ELF to bin
function(convert_to_bin TARGET)
    add_custom_command(
    	TARGET ${TARGET} POST_BUILD
    	COMMAND ${CMAKE_OBJCOPY} -O binary ${TARGET} ${TARGET}.bin
    	BYPRODUCTS ${TARGET}.bin
    )
endfunction()

# Custom function to set linker flags for creating a memory map
function(target_linker_map target)
	# Hardcoded map linker flag for gcc
	set(GEN_MAP_FILE "-Wl,-Map,")
  	get_target_property(map_dir ${target} BINARY_DIR)
  	target_link_options(${target} PRIVATE ${GEN_MAP_FILE}${map_dir}/${target}.map)
endfunction()