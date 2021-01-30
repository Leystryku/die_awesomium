//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ /
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2010
//
//=============================================================================//

PANEL.Base = "Panel"

local pnlRow 		= vgui.RegisterFile( "addon_row.lua" )
local pnlInfo 		= vgui.RegisterFile( "addon_info.lua" )

local AddonsToAdd	= {}

/*---------------------------------------------------------
	Init
---------------------------------------------------------*/
function PANEL:Init()

	self:DockMargin( 4, 4, 4, 4 )

	self.Scroller = vgui.Create( "DScrollPanel", self )
		self.Scroller:Dock( FILL )
		self.Scroller:DockMargin( 0, 0, 0, 4 )
		--self.Scroller:EnableVerticalScrollbar()

	self.Grid = vgui.Create( "DGrid", self.Scroller )
	self.Grid:Dock( TOP )

	self.InfoPanel = vgui.CreateFromTable( pnlInfo, self );
	self.InfoPanel:Dock( BOTTOM )

	self.Grid:SetCols( self:GetWide() / 100 )
	self.Grid:SetColWide( 103 )
	self.Grid:SetRowHeight( 63 )

	self:Dock( FILL )

	self.Scroller:AddItem( self.Grid )

	self:ReloadAddons()
end

function PANEL:PerformLayout()

	self.Grid:SetCols( (self:GetWide() - 16) / 100 )

end

local finished = true
function PANEL:ReloadAddons()

	finished = false
	for k, v in next, self.Grid.Items do
		v:Remove()
		self.Grid.Items[k] = nil
	end
	AddonsToAdd = {}

	local workshopaddons = engine.GetAddons()
	for k,v in pairs(workshopaddons) do
		local tbl = {}
		tbl.name = v.title
		tbl.info = "Workshop addon"
		tbl.up_date = ""
		tbl.version = "1"
		tbl.author_name = ""
		tbl.author_email = ""
		tbl.author_url = "http://steamcommunity.com/sharedfiles/filedetails/?id=" .. v.wsid
		tbl.wsid = v.wsid
		tbl.mounted = v.mounted
		AddonsToAdd[tbl.name] = tbl
	end


	local _, legacy = file.Find("addons/*", "MOD")

	for k,addonfolder in pairs(legacy) do

		local addontxt = file.Read("addons/" .. addonfolder .. "/addon.txt", "MOD")

		if(not addontxt) then continue end
		local tbl = util.KeyValuesToTable(addontxt)

		AddonsToAdd[addonfolder] = tbl
	end


	for k, v in SortedPairs( AddonsToAdd ) do

		local row = vgui.CreateFromTable( pnlRow, self.Grid )
		self.Grid:AddItem( row )
		row:Setup( k, v, self.InfoPanel );

		self.Scroller:InvalidateLayout()

	end
	finished = true
end

function PANEL:Think()
	local wsAddons = {}
	for k, v in next, AddonsToAdd do
		if v.wsid then wsAddons[v.wsid] = true end
	end
	if table.Count(wsAddons) ~= table.Count(engine.GetAddons()) and finished then
		self:ReloadAddons()
	end
end