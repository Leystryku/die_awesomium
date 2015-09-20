
local PANEL = {}
local Logo = Material( "console/gmod_logo" )

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Init()

	self:SetMouseInputEnabled( false )
	self:SetKeyboardInputEnabled( false )
	
end


/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:GetImage()

	return self.ImageName
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Paint()

	surface.SetMaterial( Logo )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( 0, 0, self:GetWide(), self:GetTall() )

	return true

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:PerformLayout()

	local w = (ScrH() / 4.0)
	local h = w
	
	self:SetPos( ScrW() * 0.1, ScrH() * 0.05 )
	self:SetSize( w, h )
	
end



vgui.Register( "PoopImage", PANEL )

local logo = vgui.Create( "PoopImage" )