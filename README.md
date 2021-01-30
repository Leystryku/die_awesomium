# die_awesomium
A dummy dll which replaces awesomium (the default garrysmod embedded web renderer) and mocks its function calls. In other words, this will give you more FPS because literally nothing will be spent on rendering annoying HTML panels all the time, and it'll be more secure because the game uses a heavily outdated embedded web render making players vulnerable as hell.


# Installing
- Put everything from the code_lua folder into Steam\steamapps\common\GarrysMod or wherever you installed gmod.
- It should replace Awesomium.dll and some other stuff. If not check that you are on the stable branch and got the right directory.

#### Extra steps
- You can also do it with code_lua_optional for some more speed.

#### Troubleshooting
If it crashes with a MessageBox on startup install the VC++ 2015 redists https://www.microsoft.com/en-us/download/details.aspx?id=48145 ( x86 )
If you're updating, make sure you delete the old files and verify the games integrity before doing so!


# Compiling
If you wish to compile this yourself.
- Head to the src/ directoryr
- Run `premake5 <target>` within that directory; a `projects` folder will then be created.

The only supported platform right now is Windows. Feel free to contribute!

Screenshot:
![In program view](http://i.imgur.com/C3O2Yjp.jpg)



# Credits
- Leystryku (me)
	* Creating this project, porting gm12 menu screen, creating the C++ part
- Freezebug
  * Porting the gmod 12 Loadingscreen
- Team Garry
  * Garrys Mod 10 Menu & Loading Screen
