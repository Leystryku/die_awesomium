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
   
   includedirs { "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//game//shared", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//public", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//public//tier3", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//public//tier2", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//public//tier1", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//public//tier0", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//game//client", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//tier1", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//tier0", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//game", "C://Users//Leystryku//Desktop//Folders//Source-Engine//src//"}
   libdirs {"C://Users//Leystryku//Desktop//Folders//Source-Engine//src//lib//public","C://Users//Leystryku//Desktop//Folders//Source-Engine//src//lib//"}
   
   -- A project defines one build target
   project "Fuck_Awesomium"
      targetname "fuck_awesomium"

      configuration "Release"
         defines { "NDEBUG", "_GENERIC" }
         
      configuration "Debug"
         defines { "DEBUG", "_GENERIC" }
         flags { "Symbols", "EnableSSE2" }
		 targetdir "build/debug"