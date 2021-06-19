project('com.github.studentenherz.myapp', 'vala', 'c')

subdir('src')
subdir('data')

schemas_dir = get_option('prefix') / get_option('datadir') / 'glib-2.0' / 'schemas'
meson.add_install_script('glib-compile-schemas', schemas_dir)