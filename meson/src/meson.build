# List of files for c_lib
c_files = files(
    'a.c',
    'b.c',
	'c.c',
    'd.c',
	'e.c',
)

# List of files for new_c_lib
new_c_files = files(
	'f.c',
	'g.c',
	'h.c',
	'i.c',
	'j.c',
)

# Include directory for the libraries
c_include = include_directories('../lib')

# Create link flag variable.
# -nostartfiles; don't include standard startup files
c_link_flags = ['-nostartfiles']

# Create static library c_lib
c_lib = static_library(
    'c',
    c_files,
    include_directories: c_include,
)

# Create static library new_c_lib
new_c_lib = static_library(
	'new_c',
	new_c_files,
	include_directories: c_include,
)

# Dependency specifies how the files and inc should be used
c_dep = declare_dependency(
    include_directories: [
        c_include, 
    ],
	link_args: c_link_flags,
    link_with: [c_lib, new_c_lib],
)
 
if meson.is_cross_build()

	linker_script_flags = []
	linker_script_deps = []

# Generate linker arguments and dependencies for linker files

	foreach entry : meson.get_external_property('linker_paths', [''])
		if entry != ''
			linker_script_flags += '-L' + meson.project_source_root() / entry
		endif
	endforeach

	foreach entry : meson.get_external_property('linker_scripts', [''])
		if entry != ''
			linker_script_flags += '-T' + entry
		endif
	endforeach

	foreach entry : meson.get_external_property('link_depends', [''])
		if entry != ''
			linker_script_deps += meson.project_source_root() / entry
		endif
	endforeach

	# Map file template hardcoded for gcc compiler 
	map_file = '-Wl,-Map,@0@.map'

	# Find objcopy.exe specified in the cross-file.
	# "disabler": If "objcopy" is not found, it will short-circuit any statement using "host_objcopy"
	host_objcopy = find_program(meson.get_external_property('objcopy'),
		required: false, disabler: true)

	if host_objcopy.found() == false
		message('Specified objcopy not found, .hex and .bin conversion is disabled.')
	endif

	# Adding executable and creating .map file 
	sample_app = executable('sample_app',
		'main.c',
		dependencies: [c_dep],
		link_args: [
			linker_script_flags,
			map_file.format(meson.current_build_dir()+'/sample_app'),
			'-Wl,--no-gc-sections',
		],
		link_depends: linker_script_deps,
	)

	# Convert output ELF to hex 
	sample_app_hex = custom_target('sample_app.hex',
		input: sample_app,
		output: 'sample_app.hex',
		command: [host_objcopy, '-O', 'ihex', '@INPUT@', '@OUTPUT@'],
		build_by_default: true
	)

	# Convert output ELF to bin
	sample_app_bin = custom_target('sample_app.bin',
		input: sample_app,
		output: 'sample_app.bin',
		command: [host_objcopy, '-O', 'binary', '@INPUT@', '@OUTPUT@'],
		build_by_default: true
	)

endif