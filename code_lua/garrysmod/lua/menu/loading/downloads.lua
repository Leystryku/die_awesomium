local pnlDownloadType = vgui.RegisterFile("download_type.lua")
local pnlRunnerType = vgui.RegisterFile("runner.lua")

PANEL.Base = "Panel"

function PANEL:Init()
	self.lblHeadline 	= vgui.Create("DLabel", self)
	self.lblHeadline:SetFont("LoadingProgress")
	self.lblHeadline:SetContentAlignment(5)

	self.Downloads = {}

	self.Downloads["other"]		= self:DownloadType("Other",		"icon16/box.png",		25)
	self.Downloads["fonts"]		= self:DownloadType("Font Files",	"icon16/font.png",		30)
	self.Downloads["textures"]	= self:DownloadType("Textures",		"icon16/palette.png",	40)
	self.Downloads["models"]	= self:DownloadType("Models",		"icon16/brick_add.png",	50)
	self.Downloads["maps"]		= self:DownloadType("Maps",			"icon16/world.png",		60)
	self.Downloads["sounds"]	= self:DownloadType("Sounds",		"icon16/sound.png",		35)
	self.Downloads["text"]		= self:DownloadType("Text",			"icon16/page_word.png",	30)
	self.Downloads["workshop"]	= self:DownloadType("Workshop",		"icon16/wrench.png",	30)
end

function PANEL:DownloadType(name, texture, speed)
	local ctrl = vgui.CreateFromTable(pnlDownloadType, self)
	ctrl:SetText(name)
	ctrl:SetIcon(texture)
	ctrl:SetSpeed(speed)
	return ctrl
end

function PANEL:PerformLayout()
	self.lblHeadline:SetPos(0, 20)
	self.lblHeadline:SetSize(ScrW(), 20)

	y = 50

	for k, panel in pairs(self.Downloads) do
		if panel:ShouldBeVisible() then
			panel:SetVisible(true)
			panel:InvalidateLayout(true)
			panel:CenterHorizontal()
			panel.y = y
			y = y + panel:GetTall() + 2
		else
			panel:SetVisible(false)
		end
	end
end

function PANEL:RefreshDownloadables()
	self.Downloadables = GetDownloadables()

	if not self.Downloadables then return end

	self:ClearDownloads()

	local iDownloading = 0
	for k, v in pairs(self.Downloadables) do
		v = string.gsub(v, ".bz2", "")
		v = string.gsub(v, ".ztmp", "")
		v = string.gsub(v, "\\", "/")

		local rmx = false
		if string.find(v, ".gma$") then
			rmx = file.Exists("downloads/server/" .. v,"GAME")
		else
			rmx = file.Exists(v,"GAME")
		end

		if not rmx then
			iDownloading = iDownloading + self:ClassifyDownload(v)
		else
			MsgC(Color(100, 100, 255),"GM10MenuDebug: ")
			MsgN("Killed obtained download " .. v)
		end
	end

	if iDownloading == 0 then return end

	self.lblHeadline:SetText(string.format("%i files needed from server", iDownloading))
	self:InvalidateLayout()
end

function PANEL:ClearDownloads()
	for k, panel in pairs(self.Downloads) do
		panel:Clean()
		panel:SetVisible(false)
	end
end

local extcats = {
	ttf = "fonts",
	gma = "workshop",
	vtf = "textures",
	vmt = "textures",
	png = "textures",
	mdl = "models",
	wav = "sounds",
	mp3 = "sounds",
	ogg = "sounds",
	bsp = "maps",
	txt = "text",
}

function PANEL:ClassifyDownload(filename)
	local cat = "other"

	local ext = string.GetExtensionFromFilename(filename)
	if extcats[ext] then
		cat = extcats[ext]
	elseif string.find(filename, "Workshop") then
		cat = "workshop"
	elseif string.find(filename, "models/") then
		cat = "models"
	end

	local ctrl = self.Downloads[cat]

	return ctrl:AddFile(filename)
end

function PANEL:CheckDownloadTables()
	-- The string table might have only partially come through, So if the number of strings changed, we need to update
	local dlcount = NumDownloadables()
	if not dlcount then return end

	if not self.NumDownloadables or dlcount ~= self.NumDownloadables then
		self.NumDownloadables = dlcount
		self:RefreshDownloadables()
	end
end

function PANEL:Clean()
	self.NumDownloadables = nil
	self.Downloadables = nil
	self.FilesToDownload = nil

	self:ClearDownloads()

	self.lblHeadline:SetText("")
end


-- We finished downloading the current file (probably)
function PANEL:CurrentDownloadFinished()
	if not self.CurrentDownload then return end

	for k, panel in pairs(self.Downloads) do
		panel:Downloaded(self.CurrentDownload)
	end

	if self.CurrentRunner then
		if IsValid(self.CurrentRunner) then
			self.CurrentRunner:SetRepeat(false)
		end
		self.CurrentRunner = nil
	end

	self.CurrentDownload = nil
end

function PANEL:DownloadingFile(filename)
	self:CheckDownloadTables()
	self:CurrentDownloadFinished()
	self.CurrentDownload = filename

	if self.CurrentRunner then
		if IsValid(self.CurrentRunner) then
			self.CurrentRunner:SetRepeat(false)
		end
		self.CurrentRunner = nil
	end

	for k, panel in pairs(self.Downloads) do
		self.CurrentRunner = panel:MakeRunner(self.CurrentDownload)
		if self.CurrentRunner then
			self.CurrentRunner:SetRepeat(true)
			break
		end
	end
end

function PANEL:StatusChanged(status)
	-- The status might have changed because a file has been downloaded, so check if the files we're waiting to download have been downloaded
	--[[if string.find(status, "Found ") or string.find(status, "Extracted ") then
		-- TODO: workshop file has finished
	end--]]
	self:CurrentDownloadFinished()
	self:CheckDownloadTables()
end

function PANEL:AddRunner(icon, speed)
	local runner = vgui.CreateFromTable(pnlRunnerType, self)
	runner:SetUp(icon, speed)

	return runner
end
