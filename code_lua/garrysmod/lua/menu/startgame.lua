//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2007
//										 
//=============================================================================//


local PANEL = {}

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Init()

	self.StartGame = vgui.Create( "DButton", self )
	self.StartGame:SetText( "Start Singleplayer" )
	self.StartGame:SetSize( 100, 20 )
	self.StartGame.DoClick = function() self:LaunchGame( false ) end
	self.StartGame:SetDisabled( true )
	self.StartGame:Dock( RIGHT )
	self.StartGame:DockMargin( 0, 22, 22, 10 )
	
	self.StartGameMulti = vgui.Create( "DButton", self )
	self.StartGameMulti:SetText( "Start Multiplayer" )
	self.StartGameMulti:SetSize( 100, 20 )
	self.StartGameMulti.DoClick = function() self:LaunchGame( true ) end
	self.StartGameMulti:SetDisabled( true )
	self.StartGameMulti:Dock( RIGHT )
	self.StartGameMulti:DockMargin( 0, 22, 22, 10 )
	
	self.Help = vgui.Create( "DLabel", self )
	self.Help:SetText( "#ChooseMapHelp" )
	self.Help:SetTextColor( Color( 0, 0, 0, 230 ) )
	
	// Restore the saved hostname
	RunConsoleCommand( "hostname", cookie.GetString( "menuui.hostname", GetConVarString( "hostname" ) ) )

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Paint()

	draw.RoundedBox( 4, 0, 0, self:GetWide(), self:GetTall(), Color( 190, 190, 190, 255 ) )

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:PerformLayout()

	self.Help:SetPos( 10, 10 )
	self.Help:SizeToContents()
	
end


/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:SetMap( strMap )

	self.Map = strMap
	self.StartGame:SetDisabled( false )
	self.StartGameMulti:SetDisabled( false )

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:LaunchGame( bMultiplayer )

	// Error Sound?
	if (!self.Map) then return end
	
	// This hook is used to close all of the GAMEUI windows.
	hook.Call( "StartGame", {} )
	
	RunConsoleCommand( "progress_enable" )
	
	if ( !bMultiplayer ) then
	
		RunConsoleCommand( "disconnect" )
		RunConsoleCommand( "maxplayers", 1 )
		
	else
	
		RunConsoleCommand( "disconnect" )
		RunConsoleCommand( "sv_cheats", "0" )
		
		RunConsoleCommand( "maxplayers", GetConVarNumber( "maxplayers" ) )
		
	end
	
	RunConsoleCommand( "map", self.Map )
	
	// Save the hostname
	cookie.Set( "menuui.hostname", GetConVarString( "hostname" ) )
		
end



vgui.Register( "StartGame", PANEL, "Panel" )
