//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2007
//										 
//=============================================================================//

language.Add( "Server_Settings", "Server Settings" )
language.Add( "Server_Name:", "Server Name:" )

language.Add( "GameModeChoice", "Gamemode Choice" )
language.Add( "Default:", "Default:" )
language.Add( "defaultgamemodehelp", "If a map doesn't have a gamemode set, we will use this gamemode. This should be 'sandbox' unless you have a good reason for changing it." )

language.Add( "Max_Players:", "Max Players:" )
language.Add( "Lan_Game", "Local Network Game" )


local PANEL = {}

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Init()

	self:EnableVerticalScrollbar( true )
	
	self:SetSpacing( 10 )
	self:SetPadding( 10 )

end

function PANEL:SetupSinglePlayer()

	local GameModes = engine.GetGamemodes()

	local GameModeSettings = vgui.Create( "DForm", self )
	GameModeSettings:SetName( "#GameModeChoice" )
	
	local mc = GameModeSettings:ComboBox( "#Default:", "gamemode" )
	
	local gm = GetConVarString("gamemode")

	for k, v in pairs( GameModes ) do
		if(not v.name or string.len(v.name) == 0) then continue end

		mc:AddChoice( v.name )

		
	end
	
	
	
	GameModeSettings:Help( "#defaultgamemodehelp" )

	self:AddItem( GameModeSettings )
	
	self:AddGamemodeSettings()
	
	
	mc:SetValue(GetConVarString("gamemode"))

end


function PANEL:SetupMultiPlayer()

	local ServerSettings = vgui.Create( "DForm", self )
		ServerSettings:SetName( "#Server_Settings" )
	
		ServerSettings:TextEntry( "#Server_Name:", "hostname" )
		ServerSettings:NumberWang( "#Max_Players:", "maxplayers", 2, 64, 0 )
		ServerSettings:CheckBox( "#Lan_Game", "sv_lan" )
		
	self:AddItem( ServerSettings )
		
	// Add the gamemode options
	self:SetupSinglePlayer()
		
end

function PANEL:AddGamemodeSettings()

	local files = file.Find( "settings/server_settings/*.txt", "GAME" )
	for k, filename in pairs( files ) do
	
		local settings_file = file.Read( "settings/server_settings/"..filename, "GAME" )
		
		if ( settings_file ) then
			local Settings = KeyValuesToTable( settings_file )
			self:AddSettings( Settings )
		end
	
	end

end

function PANEL:AddSettings( tab )

	if ( !tab ) then return end
	if ( !tab.title ) then return end
	
	local Form = vgui.Create( "DForm", self )
		self:AddItem( Form )
		Form:SetName( tab.title )
	
	// This multiple looping stuff kinda sucks
	// But I want to group the different controls
	// without breaking backwards compatibility
	
	// Checkbox
	for k, v in pairs( tab.settings ) do
	
		if ( v.type == "CheckBox" ) then
			Form:CheckBox( v.text, k )
			tab.settings[ k ] = nil
		end 
	
	end
	
	// Numeric
	for k, v in pairs( tab.settings ) do
	
		if ( v.type == "Numeric" ) then
			Form:NumberWang( v.text, k, v.low or 0, v.high or 200, v.decimals or 0 )
			tab.settings[ k ] = nil
		end
	
	end
	
	// Text	
	for k, v in pairs( tab.settings ) do
	
		Form:TextEntry( v.text, k )
	
	end

end

vgui.Register( "MapListOptions", PANEL, "DPanelList" )
