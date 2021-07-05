# die_awesomium
A dummy dll which replaces awesomium and mocks its function calls. The dummy binary might work for other applications using Awesomium too.

Was made with Garry's Mod in mind. This was made to give you more FPS while playing Garry's Mod and have less attack surface. No time will be spent on rendering annoying embedded Web-Browser panels. It will also be more secure because the game uses a heavily outdated embedded web render from around 2011 to 2013 making players vulnerable as hell.


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

![In program view](https://raw.githubusercontent.com/Leystryku/die_awesomium/master/assets/preview.jpg)



# Credits
- Leystryku (me)
	* Creating this project, porting gm12 menu screen, creating the C++ part
- Freezebug
  * Porting the gmod 12 Loadingscreen
- Tenri, Xavier & poliviasg
  * Contributing with bugfixes and maintenance
- Team Garry
  * Garrys Mod 10 Menu & Loading Screen
