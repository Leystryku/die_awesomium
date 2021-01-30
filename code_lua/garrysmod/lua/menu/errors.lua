

local lua_err = nil

hook.Add( "OnLuaError", "MenuErrorHandler", function( str, realm, addontitle, addonid )

	local errstr = "[MN] ERROR: "
	
	if(realm == "server") then
		errstr = "[SV] ERROR: "
	end
	
	if(realm == "client") then
		errstr = "[CL] ERROR: "
	end
	
	if ( isstring( addontitle ) ) then
		errstr = addontitle .. "; "
	end
	
	errstr = errstr .. str


	if(not addonid) then addonid = 0 end
	if(not addontitle) then addontitle = "" end
	


	local error =
	{
		first	= SysTime(),
		last	= SysTime(),
		times	= 1,
		title	= addontitle,
		x		= 32,
		id = addonid,
		text = errstr
	}

	lua_err = error

end )

local matAlert = Material( "icon16/error.png" )

hook.Add( "DrawOverlay", "MenuDrawLuaErrors", function()
	
	if(not lua_err) then return end
	
	local idealy = 32
	local idealx = 32
	local height = 30
	local EndTime = SysTime() - 10
	local Recent = SysTime() - 0.5

	local v = lua_err

	
	surface.SetFont( "DermaDefaultBold" )

	local width = surface.GetTextSize(lua_err.text)+40
		
	draw.RoundedBox( 2, idealx + 2, idealy + 2, width, height, Color( 40, 40, 40, 255 ) )
	draw.RoundedBox( 2, idealx, idealy, width, height, Color( 240, 240, 240, 255 ) )

	draw.RoundedBox( 2, idealx, idealy, width, height, Color( 255, 200, 0) )

	surface.SetTextColor( 90, 90, 90, 255 )
	surface.SetTextPos( idealx + 34, idealy + 8 )
	surface.DrawText( v.text )

	surface.SetDrawColor( 255, 255, 255, 150 + math.sin( idealy + SysTime() * 30 ) * 100 )
	surface.SetMaterial( matAlert )
	surface.DrawTexturedRect( idealx + 6, idealy + 6, 16, 16 )



	if ( v.last < EndTime ) then
		lua_err = nil
	end

end )
