//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2010
//										 
//=============================================================================//

PANEL.Base = "DPanel"

/*---------------------------------------------------------
	Init
---------------------------------------------------------*/
function PANEL:Init()

	self:SetSize( 100, 200 );
	self:SetBackgroundColor( Color( 150, 150, 150, 255 ) )
	
	self.Name = Label( "Addon Name", self )
	self.Name:SetFont( "TargetID" )
	self.Name:Dock( TOP )
	self.Name:SetColor( Color( 255, 255, 255, 255 ) )
	self.Name:SetExpensiveShadow( 1, Color( 0, 0, 0, 190 ) )
	self.Name:DockMargin( 16, 16, 16, 0 )
	
	self.Info = Label( "General Info about the addon. This can be quite large. So it should wrap properly and allow for a large amount of text. Well, largish.\n\n It should allow for newlines too, so you can have multiple paragraphs!", self )
	self.Info:DockMargin( 16, 16, 16, 16 )
	self.Info:SetColor( Color( 0, 0, 0, 230 ) )
	self.Info:Dock( FILL )
	self.Info:SetContentAlignment( 7 )
	self.Info:SetWrap( true )
	
	local Details = vgui.Create( "DPanel", self )
	Details:Dock( RIGHT )
	Details:DockMargin( 16, 16, 16, 16 )
	Details:SetWidth( 300 )
	Details:MoveToBack()
	
	self.Right = vgui.Create( "DPanel", Details )
	self.Right:Dock( FILL )
	self.Right:SetPaintBackground( false )
	self.Right:DockMargin( 8, 8, 8, 8 )
	
	self.Left = vgui.Create( "DPanel", Details )
	self.Left:Dock( LEFT )
	self.Left:SetPaintBackground( false )
	self.Left:SetWidth( 40 )
	self.Left:DockMargin( 8, 8, 8, 8 )

	
	self:AddDetail( "Author", "Author:", false )
	self:AddDetail( "URL", "Web:", true )
	self:AddDetail( "Email", "Email:", false )
	
	self:AddDetail( "Version", "Version:", false )
	self:AddDetail( "LastUpdate", "Update:", false )
	

	
end

function PANEL:AddDetail( Name, lblTxt, bURL )

	if ( bURL ) then
		self[Name] = vgui.Create( "DLabelURL", self.Right )
	else
		self[Name] = vgui.Create( "DLabel", self.Right )
		self[Name]:SetColor( Color( 20, 20, 20, 255 ) )	
	end
		self[Name]:Dock( TOP )
	
	local Label = Label( lblTxt, self.Left )
	Label:Dock( TOP )
	Label:SetColor( Color( 60, 60, 60, 255 ) )	

end

function PANEL:PerformLayout()

end

function PANEL:Update( info )

	self.Name:SetText( info.name )
	
	if ( string.Trim( info.author_name ) != "" ) then
		self.Author:SetText( "By "..info.author_name )
	else
		self.Author:SetText( "none" )
	end
	
	self.Info:SetText( info.info )
	self.LastUpdate:SetText( info.up_date )
	self.Version:SetText( string.format( "%.2f", tonumber( info.version ) or 1 ) )
	
	if ( info.author_email == "" ) then info.author_email = "none" end
	self.Email:SetText( info.author_email )
	
	if ( info.author_url == "" ) then info.author_url = "none" end
	self.URL:SetText( info.author_url )
	self.URL:SetURL( info.author_url )
	
end
