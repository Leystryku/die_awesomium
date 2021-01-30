# die_awesomium
A dummy dll which replaces awesomium (the default garrysmod embedded web renderer) and mocks its function calls. In other words, this will give you more FPS because literally nothing will be spent on rendering annoying HTML panels all the time, and it'll be more secure because the game uses a heavily outdated embedded web render making players vulnerable as hell.


# Installing
- Put everything from the code_lua folder into Steam\steamapps\common\GarrysMod or wherever you installed gmod.
- Do the same with everything from the Textures folder.

#### Extra steps
- You can also do it with dieawesomium_mcorerender for some more speed.


Make sure it replaces Awesomium.dll and some other stuff. If it does not replace anything, check that you got the right directory.

If it crashes with a MessageBox on startup install the VC++ 2015 redists https://www.microsoft.com/en-us/download/details.aspx?id=48145 ( 32Bit/ x86 )
If you're updating, make sure you delete the old files and verify the games integrity before doing so!


# Compiling
If you wish to compile this yourself.
- Head to the src/ directory
- open premake5.lua in your favourite text editor
- edit the `sdk_dir` variable to point to the 'src' directory of Valve's Source SDK
- Save the file and run `premake5 <target>` within that directory; a `projects` folder will then be created.

The only supported platform right now is Windows. Feel free to contribute!

Screenshot:
![In program view](http://i.imgur.com/C3O2Yjp.jpg)



# Credits
- Leystryku (me)
	* Collision System
  * Collision System
- Freezebug
  * Porting the gmod 12 Loadingscreen
- Team Garry
  * Garrys Mod 10 Menu & Loading Screen
