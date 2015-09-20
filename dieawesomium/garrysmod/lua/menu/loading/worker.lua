local MatRotate = Material("vgui/loading-rotate")
local MatLogo = Material("vgui/loading-logo")

PANEL.Base = "Panel"

function PANEL:Init()
end

function PANEL:Paint(w, h)
	local sqrdiag = h * math.sqrt(2) * 0.5

	local size = h/2

	surface.DrawTexturedRectRotated(size, size, sqrdiag, sqrdiag, 0)

	surface.SetMaterial(MatLogo)
	surface.SetDrawColor(color_white)

	surface.DrawTexturedRectRotated(size, size, sqrdiag, sqrdiag, 0)

	surface.SetMaterial(MatRotate)
	surface.DrawTexturedRectRotated(size, size, sqrdiag, sqrdiag, SysTime() * 180)
end
