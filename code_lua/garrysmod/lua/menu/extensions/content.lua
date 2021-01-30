//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2010
//										 
//=============================================================================//

PANEL.Base = "DScrollPanel"

local pnlRow 		= vgui.RegisterFile( "content_row.lua" )

/*---------------------------------------------------------
	Init
---------------------------------------------------------*/
function PANEL:Init()

	--self:EnableVerticalScrollbar()
	self:SetPadding( 1 )
	self:DockMargin( 8, 8, 8, 8 )
	
	local label = Label( "* You must restart the game to see these changes", self )
	label:Dock( BOTTOM )
	label:SetContentAlignment( 5 )
	label:SetColor( Color( 255, 30, 30 ) )

	local i = 0
	for k, v in SortedPairs( engine.GetGames() ) do
		// HL2 HAS to be mounted - so don't show it.
		// HL2MP is always mounted if we have it.. so don't show that either.
		if ( v.depot == 220 or v.depot == 340 ) then continue end
		
		local row = vgui.CreateFromTable( pnlRow, self );
		self:AddItem( row )
		row:Setup( v, i );
	
		i = i + 1
	
	end	
	
	self:Dock( FILL )
	
end
