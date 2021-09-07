-- project
set_project("xmake-testcase")

-- version
set_version("0.0.0.1")
set_xmakever("2.5.6")

-- add common flags and macros
add_defines(
	"LINUX",
	"_REENTRANT"
)

add_cxflags(
	"-Wall",
	"-fno-strict-aliasing"
)

if is_mode("release") then
	set_optimize("faster")
end

if is_mode("debug") then
	set_optimize("none")
	set_symbols("debug")
	add_defines(
	"DEBUG"
	)
end

includes("xmake/**/xmake.lua")

