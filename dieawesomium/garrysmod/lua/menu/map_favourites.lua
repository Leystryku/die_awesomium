//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2009
//										 
//=============================================================================//

require( "von" )
glon = {}
glon.decode = von.deserialize
glon.encode = von.serialize

module( "map_favourites", package.seeall )

local faves = glon.decode( cookie.GetString( "FavMaps", "" ) ) or {};

function RebuildCookie()

	local str = glon.encode( faves )
	cookie.Set( "FavMaps", str )

end

function Add( mapname )

	faves[ mapname ] = 1
	
	RebuildCookie()
	
	if ( IsValid(SinglePlayerMenu) ) then SinglePlayerMenu:RebuildFavourites() end
	if ( IsValid(MultiPlayerMenu) ) then MultiPlayerMenu:RebuildFavourites() end

end

function Remove( mapname )

	faves[ mapname ] = nil
	
	RebuildCookie()
	
	if ( IsValid(SinglePlayerMenu) ) then SinglePlayerMenu:RebuildFavourites() end
	if ( IsValid(MultiPlayerMenu) ) then MultiPlayerMenu:RebuildFavourites() end

end

function Count()
	return table.Count( faves )
end

function Get()

	local formatted = {}
	for k, v in pairs( faves ) do
		table.insert( formatted, g_MapList[ k .. ".bsp" ] )
	end

	return formatted

end