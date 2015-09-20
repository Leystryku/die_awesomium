//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2010
//										 
//=============================================================================//

PANEL.Base = "DPanel"

surface.CreateFont( "LargeBold", {
font = "Tahoma",
size=17,
weight=1000,
antialias=true,
additive=false
})
/*---------------------------------------------------------
	Init
---------------------------------------------------------*/
function PANEL:Init()

	self:Dock( TOP )
	self:DockMargin( 1, 1, 1, 0 )
	self:SetHeight( 32 );
	
	self.alt = false;
	
	self.Label = vgui.Create( "DLabel", self );
	self.Label:Dock( LEFT )
	self.Label:DockMargin( 16, 0, 0, 0 )
	self.Label:SetWidth( 300 )
	self.Label:SetFont( "LargeBold" )
	self.Label:SetExpensiveShadow( 1, Color( 0, 0, 0, 130 ) )
	
	self.CheckBox = vgui.Create( "DCheckBox", self )
	self.CheckBox:Dock( RIGHT )
	self.CheckBox:SetWidth( 16 );
	self.CheckBox:DockMargin( 10, 8, 10, 8 )

end

function PANEL:Setup( info, rowid )

	self.alt = math.fmod( rowid, 2 ) == 1;
	self.available = true;
	
	self.Label:SetText( info.title )
	
	if ( !info.installed ) then
	
		self.CheckBox:SetVisible( false )
		self.available = false;
		
		self.Label = vgui.Create( "DLabel", self );
		self.Label:Dock( RIGHT )
		self.Label:DockMargin( 0, 0, 8, 0 )
		self.Label:SetWidth( 80 )
		self.Label:SetFont( "DefaultLarge" )
		self.Label:SetColor( Color( 0, 0, 0, 255 ) )
		self.Label:SetText( "UNAVAILABLE" )
			
	end
	
	if ( info.mounted ) then
		self.CheckBox:SetValue( true )
	end
	
	function self.CheckBox.OnChange( checkbox, val )
		self:UpdateColor();
		engine.SetMounted( tostring( info.depot ), val );
	end
	
	self:UpdateColor()

end

function PANEL:PerformLayout()
	self:UpdateColor()
end

function PANEL:UpdateColor()

	self.Label:SetAlpha( 255 )
	self.Label:SetColor( Color( 255, 255, 255, 255 ) )
	
	if ( !self.CheckBox:GetChecked() || !self.available ) then
		self:SetBackgroundColor( Color( 100, 100, 100, 255 ) )	
		self.Label:SetColor( Color( 255, 255, 255, 255 ) )
		self.Label:SetAlpha( 100 )
	elseif ( self.alt ) then
		self:SetBackgroundColor( Color( 163, 163, 163, 255 ) )
	else	
		self:SetBackgroundColor( Color( 185, 185, 185, 255 ) )
	end

end