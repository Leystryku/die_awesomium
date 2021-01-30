//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ /
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2007
//
//=============================================================================//

include( "map_favourites.lua" )
include( "map_icon.lua" )

local PANEL = {}

AccessorFunc( PANEL, "m_pController", 			"Controller" )

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Init()

	self:SetMouseInputEnabled( true )
	self:SetKeyboardInputEnabled( false )

	self.PanelList = vgui.Create( "DPanelList", self )
	self.PanelList:EnableVerticalScrollbar( true )
	self.PanelList:SetSpacing( 2 )
	self.PanelList:SetPadding( 2 )

	self.Category = {}

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:BuildMaps()

	timer.Simple(0.1, function()
		local g_MapListCategorised = GetMapList()
		g_MapListCategorised[ "Favourites" ] = map_favourites.Get()
		self:AddCategory( "Favourites", true )
		self:AddCategory( "Garry's Mod", map_favourites.Count() == 0  )

		for k, v in SortedPairs( g_MapListCategorised ) do

			if ( k != "Garry's Mod" && k != "Other" && k != "Favourites" ) then
				self:AddCategory( k, false )
			end

		end

		self:AddCategory( "Other", false )

		self:PerformLayout()

	end)
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Reload()

	self.PanelList:Clear()
	self:BuildMaps()

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:AddCategory( strCategoryName, bExpanded )
	local g_MapListCategorised = GetMapList()
	if (!g_MapListCategorised[ strCategoryName ]) then return end

	local count = table.Count( g_MapListCategorised[ strCategoryName ] )
	if ( count == 0 && strCategoryName != "Favourites" ) then return end

	local Category = vgui.Create( "DCollapsibleCategory" )
	self.PanelList:AddItem( Category )

	self.Category[ strCategoryName ] = Category

	self:RebuildCategory( strCategoryName )

	Category:SetExpanded( bExpanded )

end

function PANEL:RebuildCategory( CatName )

	local Category = self.Category[ CatName ];
	if ( !IsValid( Category ) ) then return end

	if ( IsValid( Category.Contents ) ) then
		Category.Contents:Remove()
	end

	local g_MapListCategorised = GetMapList()
	local count = table.Count( g_MapListCategorised[ CatName ] )
	Category:SetLabel( CatName .. " (" .. count .. " maps) "  )

	local Contents = vgui.Create( "DPanelList" );
	Contents:EnableHorizontal( true )
	Contents:SetAutoSize( true )
	Contents:SetSpacing( 2 )
	Contents:SetPadding( 4 )
	Contents:SetDrawBackground( false )

	Category:SetContents( Contents )

	for k, v in SortedPairs( g_MapListCategorised[ CatName ] ) do

		local icon = self:AddMap( v, Contents )

		if ( CatName == "Favourites" ) then
			icon:SetFavourite( true )
		end

	end

	Category:PerformLayout()
	self:InvalidateLayout()

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:AddMap( MapTable, Contents )

	local icon = vgui.Create( "MapIcon", Contents )
	icon:SetMap( MapTable )
	icon:SetController( self:GetController() )

	Contents:AddItem( icon )
	return icon

end


/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:PerformLayout()

	if ( self.Category[ "Favourites" ] ) then
		self.Category[ "Favourites" ]:SetVisible( map_favourites.Count() > 0  )
	end

	self.PanelList:SetPos( 0, 0 )
	self.PanelList:SetSize( self:GetWide(), self:GetTall() )
	self.PanelList:InvalidateLayout()

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Setup()

	self:BuildMaps()

end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:RebuildFavourites()

	self:PerformLayout()

	local g_MapListCategorised = GetMapList()
	g_MapListCategorised[ "Favourites" ] = map_favourites.Get()
	self:RebuildCategory( "Favourites" )

	self:PerformLayout()

end

vgui.Register( "MapListIcons", PANEL )
