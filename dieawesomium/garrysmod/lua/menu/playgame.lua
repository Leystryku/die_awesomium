//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2007
//										 
//=============================================================================//

language.Add( "MultiplayerGame", "Multiplayer Game" )

local PANEL = {}

/*---------------------------------------------------------
	Init
---------------------------------------------------------*/
function PANEL:Init()

	self:SetMouseInputEnabled( true )
	self:SetKeyboardInputEnabled( true )
	
	self:SetDeleteOnClose( false )
	
	self:SetTitle( "#MultiplayerGame" )
	
	self:CreateControls()
	
end


/*---------------------------------------------------------
	CreateControls
---------------------------------------------------------*/
function PANEL:CreateControls()

	self.StartGame = vgui.Create( "StartGame", self )
--	self.StartGame:SetMultiplayer()
	
	self.MapSheet = vgui.Create( "DPropertySheet", self )
	self.MapSheet:SetFadeTime( 0.3 )
	
	self.MapIcons = vgui.Create( "MapListIcons" )
	self.MapIcons:SetController( self.StartGame )
	self.MapIcons:Setup()
	
	local MapList = vgui.Create( "MapListList" )
	MapList:SetController( self.StartGame )
	
	local Options = vgui.Create( "MapListOptions", self )
	Options:SetupMultiPlayer()
		
	self.MapSheet:AddSheet( "Icons", self.MapIcons, "icon16/application_view_tile.png" )
	self.MapSheet:AddSheet( "List", MapList, "icon16/application_view_detail.png" )
	self.MapSheet:AddSheet( "Options", Options, "icon16/application_view_detail.png" )

end

/*---------------------------------------------------------
	PerformLayout
---------------------------------------------------------*/
function PANEL:PerformLayout()

	self:SetSize( 450, ScrH() * 0.8 )
	
	self.MapSheet:SetPos( 8, 25 )
	self.MapSheet:SetSize( self:GetWide() - 16, self:GetTall() - 25 - 8 - 60 - 8 )
	self.MapSheet:InvalidateLayout()
	
	self.StartGame:SetPos( 8, self:GetTall() - 60 - 8 )
	self.StartGame:SetSize( self:GetWide() - 16, 60 )
	
	self.BaseClass.PerformLayout( self )
	
end

function PANEL:RebuildFavourites()

	self.MapIcons:RebuildFavourites()

end

vgui.Register( "StartMultiPlayerGame", PANEL, "DFrame" )

MultiPlayerMenu = vgui.Create( "StartMultiPlayerGame" )
MultiPlayerMenu:SetVisible( false )

local function menu_play()

	if ( MultiPlayerMenu ) then
	
		MultiPlayerMenu:SetVisible( true )
		MultiPlayerMenu:Center()
		MultiPlayerMenu:MakePopup()
	
	end

end

concommand.Add( "menu_play", menu_play )

local function CloseMultiPlayerMenu()

	if ( MultiPlayerMenu ) then
		MultiPlayerMenu:Close()
	end

end

hook.Add( "StartGame", "CloseMultiPlayerMenu", CloseMultiPlayerMenu )