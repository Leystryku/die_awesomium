//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2007
//										 
//=============================================================================//


local pnlLoadProgress = vgui.RegisterFile( "loading/progress.lua" )
local pnlDownloads = vgui.RegisterFile( "loading/downloads.lua" )

local PANEL = {}

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Init()

	self.Progress = vgui.CreateFromTable( pnlLoadProgress, self )
	self.Downloads = vgui.CreateFromTable( pnlDownloads, self )
	
	/*
	
	// Using the default progress bar thing for now..
	
	self.Button = vgui.Create( "DButton", self )
	self.Button:SetText( "#Cancel" )
	
	function self.Button:DoClick() CancelLoading() end
	*/

end


/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:PerformLayout()

	self:SetSize( ScrW(), ScrH() )
	
	self.Progress:InvalidateLayout( true )
	self.Progress:SetPos( 0, ScrH() * 0.4 )
	
	self.Downloads:SetPos( 0, 0 )
	self.Downloads:SetSize( ScrW(), ScrH() * 0.4 )
	
	/*
	self.Button:AlignRight( 50 )
	self.Button:AlignBottom( 50 )
	*/
	
end


/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Paint()

	surface.SetDrawColor( 250, 250, 250, 255 )
	surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
	
end


/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:StatusChanged( strStatus )

	// If it's a file download we do some different stuff..
	if ( string.find( strStatus, "Downloading " ) ) then
	
		local Filename = string.gsub( strStatus, "Downloading ", "" )
		
		self.Progress:DownloadingFile( Filename )
		self.Downloads:DownloadingFile( Filename )
	
	return end
	
	self.Progress:StatusChanged( strStatus )
	self.Downloads:StatusChanged( strStatus )
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:CheckForStatusChanges()

	local str = GetLoadStatus()
	if ( !str ) then return end
	
	str = string.Trim( str )
	str = string.Trim( str, "\n" )
	str = string.Trim( str, "\t" )
	
	str = string.gsub( str, ".bz2", "" )
	str = string.gsub( str, ".ztmp", "" )
	str = string.gsub( str, "\\", "/" )
	
	if ( self.OldStatus && self.OldStatus == str ) then return end
	
	self.OldStatus = str
	self:StatusChanged( str )

end


/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:OnActivate()

	// Clean it up
	self:OnDeactivate()
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:OnDeactivate()

	self.Progress:Clean()
	self.Downloads:Clean()
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Think()

	self:CheckForStatusChanges()
	
end

local PanelType_Loading = vgui.RegisterTable( PANEL, "EditablePanel" )


local pnlLoading = nil

function GetLoadPanel()

	if ( !pnlLoading ) then
		pnlLoading = vgui.CreateFromTable( PanelType_Loading )
	end

	return pnlLoading
	
end



