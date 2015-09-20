PANEL.Base = "Panel"

function PANEL:Init()
	self.Icon = vgui.Create("DImage", self)

	self.Shadow = vgui.Create("DImage", self)
	self.Shadow:SetImage("gui/legs")

	if math.random(0, 30) == 1 then
		self.Overlay = vgui.Create("DImage", self)
		self.Overlay:SetImage("gui/legs"..math.random(1, 2)) -- Random this
	end
end

function PANEL:SetUp(Icon, Speed)
	self.Icon:SetImage(Icon)

	local Distance = math.Rand(0, 30)

	self.BaseY = self:GetParent():GetTall() -64 - Distance
	self:SetPos(-62, self.BaseY)
	self:SetZPos(20 - Distance)

	self.Speed = Speed * math.Rand(0.8, 1.0) * 0.5

	self.StartTime = SysTime()
	self.EndTime = SysTime() + self.Speed * 0.5
end

function PANEL:PerformLayout()
	self:SetSize(64, 64)

	self.Icon:SetSize(16, 16)
	self.Icon:SetPos(24, 32)

	if IsValid(self.Overlay) then
		self.Overlay:SetPos(0, 0)
		self.Overlay:SetSize(64, 64)
		self.Overlay:SetZPos(1)
	end

	self.Shadow:SetPos(0, 0)
	self.Shadow:SetSize(64, 64)
	self.Shadow:SetZPos(1)
end

function PANEL:Think()
	if not self.StartTime then return end

	local delta = (SysTime() - self.StartTime) / (self.EndTime - self.StartTime)

	local x = Lerp(delta, -62, ScrW())
	local y = self.BaseY - 64 + math.sin(x * 0.01) * 32

	self:SetPos(x, y)

	if x >= ScrW() then

		if not self.Repeat then
			self:Remove()
		else
			-- Go around again..
			self.EndTime = SysTime() + (self.EndTime - self.StartTime)
			self.StartTime = SysTime()
			self.x = -62
		end
	end

	-- Up/Down motion. I don't like it.
	-- self.Icon:SetPos(24, 32 + math.sin((SysTime() * self.Speed) * 0.2) * 3)
end

function PANEL:SetRepeat(shouldrepeat)
	self.Repeat = shouldrepeat
end
