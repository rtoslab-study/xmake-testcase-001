target("hello_c")
	set_kind("binary")

	set_targetdir("$(buildir)/$(os)/$(arch)/$(mode)/shared")

	add_deps(
	"lib_c_c-shared"
	)

	add_includedirs(
        "$(projectdir)/src/inc"
	)

	add_files(
	"$(projectdir)/src/app/hello_c/*.c"
	)

	add_linkdirs(
	"$(buildir)/$(os)/$(arch)/$(mode)/shared"
	)

	add_links(
	"_c_c"
	)

