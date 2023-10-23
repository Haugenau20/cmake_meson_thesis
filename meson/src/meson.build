c_files = files(
    'a.c',
    'b.c',
	'c.c',
    'd.c',
	'e.c',
)

new_c_files = files(
	'f.c',
	'g.c',
	'h.c',
	'i.c',
	'j.c',
)

c_include = include_directories('../lib')

c_compile_flags = [

]

c_link_flags = [
	'-nostartfiles',
]

new_c_lib = static_library(
	'new_c',
	new_c_files,
	c_args: c_compile_flags,
	include_directories: c_include,
)

c_lib = static_library(
    'c',
    c_files,
	c_args: c_compile_flags,
    include_directories: c_include,
)

c_dep = declare_dependency(
    include_directories: [
        c_include, 
        host_machine_arch_sys_include,
    ],
	compile_args: c_compile_flags,
	link_args: c_link_flags,
    link_with: [c_lib, new_c_lib]
)

linker_script_flags = ['--specs=nosys.specs']
linker_script_deps = []

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

map_file = '-Wl,-Map,@0@.map'

if meson.is_cross_build()

	host_objcopy = find_program(meson.get_external_property('objcopy'),
		required: false, disabler: true)

	if host_objcopy.found() == false
		message('Specified objcopy not found, .hex and .bin conversion is disabled.')
	endif

	sample_app = executable('sample_app',
		'main.c',
		dependencies: c_dep,
		link_args: [
			linker_script_flags,
			map_file.format(meson.current_build_dir()+'/sample_app'),
		],
		link_depends: linker_script_deps,
	)

	sample_app_hex = custom_target('sample_app.hex',
		input: sample_app,
		output: 'sample_app.hex',
		command: [host_objcopy, '-O', 'ihex', '@INPUT@', '@OUTPUT@'],
		build_by_default: true
	)

	sample_app_bin = custom_target('sample_app.bin',
		input: sample_app,
		output: 'sample_app.bin',
		command: [host_objcopy, '-O', 'binary', '@INPUT@', '@OUTPUT@'],
		build_by_default: true
	)

endif