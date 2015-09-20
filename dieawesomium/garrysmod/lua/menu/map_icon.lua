//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2007
//										 
//=============================================================================//


local PANEL = {}
g_SelectedMap = nil

AccessorFunc( PANEL, "m_pController", 			"Controller" )
AccessorFunc( PANEL, "m_bFavourite", 			"Favourite" )

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Init()

	self:SetMouseInputEnabled( true )
	self:SetKeyboardInputEnabled( false )
	
	self.Label = vgui.Create( "DLabel", self )
	self.Label:SetText( "Map Text" )
	self.Label:SetTextColor( Color( 255, 255, 255, 250 ) )
	self.Label:SetMouseInputEnabled( false )
	
	
	self.Icon = vgui.Create( "DImage", self )
	self.Icon:SetKeepAspect( true )
	self.Icon:SetMouseInputEnabled( false )
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:SetMap( MapTable )

	self.Label:SetText( MapTable.Name )
	self.Icon:SetOnViewMaterial( MapTable.Material )
	self.Icon:SetFailsafeMatName( "maps/noicon.vmt" )
	
	self.MapName = MapTable.Name
	
	self:PerformLayout()

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:PerformLayout()

	self:SetSize( 128, 100 )
	
	self.Label:SetPos( 10, self:GetTall() - self.Label:GetTall() )
	self.Label:SetWide( self:GetWide() - 20 )
	self.Label:SetContentAlignment( 5 )
	self.Label:SetZPos( 100 )
	
	local size = self:GetTall() - self.Label:GetTall()
	self.Icon:SetSize( self:GetWide()-2, self:GetTall()-2 )
	self.Icon:SetPos( 1, 1 )

end


/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:ApplySchemeSettings()

//	self.Label:SetFont( "DefaultSmallDropShadow" )

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Paint()

	if ( g_SelectedMap == self ) then
		surface.SetDrawColor( 255, 155, 20, 255 )
	else
		surface.SetDrawColor( 255, 255, 255, 50 )
	end
	
	surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )
	local y = self.Label.y
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:PaintOver()

	if ( g_SelectedMap == self ) then
		surface.SetDrawColor( 255, 155, 20, 255 )
	else
		surface.SetDrawColor( 155, 155, 155, 200 )
	end
	
	local x, y = self.Label:GetPos()
	
	surface.DrawRect( 1, y, self:GetWide() - 2, self:GetTall() - y )
	
	self.Label:PaintManual()

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:OnMousePressed( mcode )

	// Loop back if no VBar
	if ( mcode != MOUSE_LEFT ) then
		self:OpenMenu()
		return
	end
	
	self:GetController():SetMap( self.MapName )
	
	if ( g_SelectedMap == self && self.LastPress && self.LastPress > SysTime() - 0.3 ) then
	
		self:GetController():LaunchGame()
	
	end
	
	self:GetController():SetMap( self.MapName )
	
	g_SelectedMap = self
	self.LastPress = SysTime()

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:OpenMenu()

	local menu = DermaMenu()
	
		menu:AddOption( "Copy to Clipboard", function() SetClipboardText( self.MapName ) end )
		
		if ( self.m_bFavourite ) then
			menu:AddOption( "Remove From Favourites", function() map_favourites.Remove( self.MapName ) end )
		else
			menu:AddOption( "Add To Favourites", function() map_favourites.Add( self.MapName ) end )
		end
		
	menu:Open()

end

vgui.Register( "MapIcon", PANEL )