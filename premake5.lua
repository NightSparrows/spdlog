project "spdlog"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/**.h",
		"src/spdlog.cpp",
		"src/stdout_sinks.cpp",
		"src/color_sinks.cpp",
		"src/file_sinks.cpp",
		"src/async.cpp",
		"src/cfg.cpp"
	}
	
	includedirs {
		"include"
	}

	defines {
		"SPDLOG_COMPILED_LIB"
	}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"