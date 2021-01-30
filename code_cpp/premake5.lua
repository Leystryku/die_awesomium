solution "die_awesomium"
    language "C++"
    location "project"
    targetdir "build/release"

    configuration "vs*" -- speed shit
    --gr- = no typeinfo
    buildoptions({"/Qpar", "/Qfast_transcendentals", "/GL", "/Ot", "/Gm", "/MP", "/Gy", "/Gw"})
    linkoptions { "/OPT:REF", "/OPT:ICF", "/LTCG"}

    flags { "NoMinimalRebuild", "NoBufferSecurityCheck"}

    optimize "on"
    omitframepointer "on"
    vectorextensions "SSE2"
    floatingpoint "fast"
    symbols "On"

    vpaths {
        ["Header Files/*"] = "src/**.h",
        ["Source Files/*"] = "src/**.cpp",
    }

    kind "SharedLib"

    configurations { "Debug", "Release" }

    files { "src/**.h", "src/**.cpp" }

    -- A project defines one build target
    project "die_awesomium"
        configuration "Release"
            defines { "NDEBUG", "_GENERIC" }
            targetname "awesomium"
            targetdir "build/release"

        configuration "Debug"
            defines { "DEBUG", "_GENERIC" }
            targetname "awesomium"
            targetdir "build/debug"
