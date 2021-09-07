target("lib_c_a-shared")
	set_kind("static")
	set_basename("_c_a")

	set_targetdir("$(buildir)/$(os)/$(arch)/$(mode)/shared")

	add_includedirs(
        "$(projectdir)/src/inc"
	)

	add_files(
	"$(projectdir)/src/lib/lib_c_a/*.c"
	)

	add_cxflags("-fPIC")

target("lib_c_b-shared")
	set_kind("static")
	set_basename("_c_b")

	set_targetdir("$(buildir)/$(os)/$(arch)/$(mode)/shared")

	add_includedirs(
        "$(projectdir)/src/inc"
	)

	add_files(
	"$(projectdir)/src/lib/lib_c_b/*.c"
	)

	add_cxflags("-fPIC")

target("lib_c_c-shared")
	set_kind("shared")
	set_basename("_c_c")

	set_targetdir("$(buildir)/$(os)/$(arch)/$(mode)/shared")

	add_deps(
	"lib_c_a-shared",
	"lib_c_b-shared"
	)

	add_includedirs(
        "$(projectdir)/src/inc"
	)

	add_files(
	"$(projectdir)/src/lib/lib_c_c/*.c"
	)

	add_shflags(
	"-Wl,-z,defs",
	{force = true}
	)

	add_linkdirs(
	"$(buildir)/$(os)/$(arch)/$(mode)/shared"
	)

	add_links(
	"_c_a",
	"_c_b"
	)

