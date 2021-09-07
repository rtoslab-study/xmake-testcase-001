target("lib_c_d-shared")
	set_kind("shared")
	set_basename("_c_d")

	set_targetdir("$(buildir)/$(os)/$(arch)/$(mode)/shared")

	add_deps(
	"lib_c_c-shared"
	)

	add_includedirs(
        "$(projectdir)/src/inc"
	)

	add_files(
	"$(projectdir)/src/lib/lib_c_d/*.c"
	)

	add_ldflags(
	"-Wl,-soname,lib_c_d.so.1",
	{force = true}
	)

	add_shflags(
	"-Wl,-z,defs",
	{force = true}
	)

	add_linkdirs(
	"$(buildir)/$(os)/$(arch)/$(mode)/shared"
	)

	add_links(
	"_c_c"
	)

	add_syslinks(
	"m"
	)

