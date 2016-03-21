solution "Fuck_Awesomium"
    language "C++"
    location "project"
    targetdir "build/release"

    configuration "vs*" -- speed shit
    --gr- = no typeinfo
    buildoptions({"/Qpar", "/Qfast_transcendentals", "/GL", "/Ot", "/Gm", "/MP", "/Gy", "/Gw"})
    linkoptions { "/OPT:REF", "/OPT:ICF", "/LTCG"}

    flags { "Optimize", "NoMinimalRebuild", "NoFramePointer", "EnableSSE2", "FloatFast", "NoBufferSecurityCheck"}

    vpaths {
        ["Header Files/*"] = "src/**.h",
        ["Source Files/*"] = "src/**.cpp",
    }

    kind "SharedLib"

    configurations { "Debug", "Release" }

    files { "src/**.h", "src/**.cpp" }

    local sdk_dir = "C:/sdk13/mp/src/" -- Change this to suit your setup

    local function sdk(s) return sdk_dir..s end

    includedirs { sdk"public",       sdk"public/tier0", sdk"public/tier1",
                  sdk"public/tier2", sdk"public/tier3", sdk"public/tier0",
                  sdk"game",         sdk"game/client",  sdk"game/shared",
                  sdk"tier1",        sdk"tier0",        sdk"common",
				  sdk "", }

    libdirs     { sdk"lib", sdk"lib/public" }

    -- A project defines one build target
    project "Fuck_Awesomium"
        configuration "Release"
            defines { "NDEBUG", "_GENERIC" }
            targetname "awesomium"
            targetdir "../dieawesomium/bin"

        configuration "Debug"
            defines { "DEBUG", "_GENERIC" }
            flags { "Symbols", "EnableSSE2" }
            targetdir "build/debug"
