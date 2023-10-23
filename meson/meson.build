project('Repeatability_test_LINAK_pc',
    ['c'],
    default_options : [
        'c_std=c11',
    ],
    meson_version: '>=1.0.0',
    version: '1.0',
)

# bash = find_program('bash', required: false, disabler: true)

# url = 'http://my_url/'
# rev = 'head'

# run_command(
#         bash,
#         meson.project_source_root() + '/test.sh',
#         meson.project_source_root(),
#         url,
#         rev,
#         capture: false,
#         check: true,
# )

subdir('arch')
subdir('src')

