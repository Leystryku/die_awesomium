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
	
	AddonsToAdd = {}
	
	local workshopaddons = engine.GetAddons()
	for k,v in pairs(workshopaddons) do
		local tbl = {}
		tbl.name = "[W] " .. v.title
		tbl.info = "workshop addon"
		tbl.up_date = ""
		tbl.version = "1"
		tbl.author_name = ""
		tbl.author_email = ""
		tbl.author_url = "http://steamcommunity.com/sharedfiles/filedetails/?id=" .. v.wsid
		AddonsToAdd[tbl.name] = tbl
	end
	
	
	local _, legacy = file.Find("addons/*", "MOD")
	
	for k,addonfolder in pairs(legacy) do
		
		local addontxt = file.Read("addons/" .. addonfolder .. "/addon.txt", "MOD")
		
		if(not addontxt) then continue end
		local tbl = util.KeyValuesToTable(addontxt)
		
		AddonsToAdd[addonfolder] = tbl
	end
	
	self.Grid:SetCols( self:GetWide() / 100 )
	self.Grid:SetColWide( 103 )
	self.Grid:SetRowHeight( 63 )
	
	self:Dock( FILL )
	
	self.Scroller:AddItem( self.Grid )
	
end

function PANEL:PerformLayout()

	self.Grid:SetCols( (self:GetWide() - 16) / 100 )

end

function PANEL:AddQueuedAddons()

	if ( table.Count( AddonsToAdd ) == 0 ) then return end
	
	for k, v in SortedPairs( AddonsToAdd ) do
	
		local row = vgui.CreateFromTable( pnlRow, self.Grid )
		self.Grid:AddItem( row )
		row:Setup( k, v, self.InfoPanel );
	
		AddonsToAdd[ k ] = nil
	
		self.Scroller:InvalidateLayout()
		
		// Select the first entry
		if ( k == 1 ) then
			row:DoClick()
		end
		
		return
		
	end
	
end

function PANEL:Think()

	self:AddQueuedAddons()

end
