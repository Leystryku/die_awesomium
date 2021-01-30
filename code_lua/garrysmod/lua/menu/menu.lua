
//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2007
//										 
//=============================================================================//

include( "menu/oldfonts.lua" )
include( "menu/progressbar.lua" )
include( "menu/logo.lua" )

include( "menu/getmaps.lua" )

include( "menu/maplist_listview.lua" )
include( "menu/maplist_iconview.lua" )
include( "menu/startgame.lua" )
include( "menu/map_options.lua" )

include( "menu/playgame.lua" )

include( "menu/loading.lua" )

include( "menu/extensions/extensions.lua" )

include( "menu/achievements.lua" )

include("debug.lua")
include("errors.lua")
include("selector.lua")

timer.Simple( 0, function()


	hook.Run( "GameContentChanged" )

end )

if(file.Exists("sounds/leymenu/gamestartup.mp3", "GAME")) then
	timer.Simple(1, function() 

		surface.PlaySound("leymenu/gamestartup.mp3")

	end)
end
