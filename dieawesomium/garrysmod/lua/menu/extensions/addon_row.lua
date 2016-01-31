//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ /
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2010
//
//=============================================================================//

PANEL.Base = "DButton"

/*---------------------------------------------------------
	Init
---------------------------------------------------------*/
function PANEL:Init()

	self:SetSize( 100, 60 );

	self:SetContentAlignment( 2 )

	self:SetTextInset( 0, -5 )

end

function PANEL:ApplySchemeSettings()

--	self:SetFont( "Default" )
	--self:SetTextColor( Color( 90, 90, 100, 255 ) )

end

function PANEL:Setup( name, info, InfoPanel )


	self.Info = info

	self:SetText( self.Info.name )

	self.DoClick = function()

		SelectedAddon = self
		InfoPanel:Update( self.Info )

	end

	self.DoRightClick = function()
		if not self.Info.wsid then return end
		local m = DermaMenu()
		m:AddOption("Toggle", function()
			self.Info.mounted = not self.Info.mounted
			steamworks.SetShouldMountAddon(self.Info.wsid, self.Info.mounted)
			steamworks.ApplyAddons()
			Extensions.Addons.InfoPanel.Info:SetText(self.Info.mounted and "Enabled" or "Disabled")
		end)
		m:AddOption("Unsubscribe", function()
			steamworks.SetShouldMountAddon(self.Info.wsid, false)
			steamworks.ApplyAddons()
			steamworks.Unsubscribe(self.Info.wsid)
		end)
		m:Open()
	end

	if ( file.Exists( "addons/"..name.."/icon.tga", "MOD" ) ) then
		self.Image = vgui.Create( "TGAImage", self )
		self.Image:SetSize( 60, 35 )
		self.Image:SetMouseInputEnabled( false )
		self.Image:Center()
		self.Image.y = 8
		self.Image:LoadTGAImage( "addons/"..name.."/icon.tga", "MOD" );
	else
		self.Image = vgui.Create( "DImage", self )
		self.Image:SetSize( 60, 35 )
		self.Image:SetMouseInputEnabled( false )
		self.Image:Center()
		self.Image.y = 8
		self.Image:SetMaterial("materials/noicon.png")
	end

end

function PANEL:Paint()

	if ( self == SelectedAddon ) then

		draw.RoundedBox( 4, 0, 0, self:GetWide(), self:GetTall(), Color( 100, 200, 255, 255 ) )
		draw.RoundedBox( 4, 2, 2, self:GetWide()-4, self:GetTall()-4, Color( 130, 230, 255, 255 ) )

	elseif ( self.Hovered ) then

		draw.RoundedBox( 4, 1, 1, self:GetWide()-2, self:GetTall()-2, Color( 255, 250, 210, 255 ) )

	end

end

function PANEL:PaintOver()

end
