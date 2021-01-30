surface.CreateFont("LoadingProgress", {
	font = "Coolvetica",
	size = 22,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

local pnlLoadWorker = vgui.RegisterFile("worker.lua")
local NumLabels = 10

PANEL.Base = "Panel"

function PANEL:Init()
	self.Labels = {}

	for i = 1, NumLabels do
		self.Labels[i] = vgui.Create("DLabel", self)
		self.Labels[i]:SetFont("LoadingProgress")
		self.Labels[i]:SetContentAlignment(5)
		self.Labels[i]:SetText("")
		if i == 1 then
			self.Labels[i]:SetTextColor(Color(120, 120, 120, 255))
		else
			self.Labels[i]:SetTextColor(Color(120, 120, 120, 127 * (1 - (i/NumLabels))))
		end
	end

	self.LoadWorker = vgui.CreateFromTable(pnlLoadWorker, self)
end

function PANEL:PerformLayout()
	self:SetSize(ScrW(), ScrH())

	self.LoadWorker:SetSize(150, 150)
	self.LoadWorker:CenterHorizontal()

	for i = 1, NumLabels do
		self.Labels[i]:SetSize(ScrW(), 24)
		self.Labels[i]:SetPos(0, 150 + 24 * (i-1))
	end
end

function PANEL:StatusChanged(strStatus)
	for i = NumLabels, 2, -1 do
		self.Labels[i]:SetText(self.Labels[i - 1]:GetValue())
	end

	self.Labels[1]:SetText(strStatus)
end

function PANEL:DownloadingFile(filename)
	local translated = TranslateDownloadableName(filename) or filename

	self:StatusChanged("Downloading " .. translated)
end

function PANEL:Paint(w, h)
end

function PANEL:Clean()
	for i = 1, NumLabels do
		self.Labels[i]:SetText("")
	end
end
