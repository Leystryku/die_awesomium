//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2009
//										 
//=============================================================================//

local PANEL = {}

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Init()

	self:SetMouseInputEnabled( true )
	self:SetKeyboardInputEnabled( false )
	
	self.Name = vgui.Create( "DLabel", self )
	self.Name:SetFont( "Trebuchet22" )
	self.Name:SetColor( Color( 170, 240, 90 ) )
	self.Name:SetText( "Unnammed"  )
	self.Name:SetExpensiveShadow( 2, Color( 0, 0, 0, 100 ) )
	
	self.Desc = vgui.Create( "DLabel", self )
	self.Desc:SetFont( "DefaultBold" )
	self.Desc:SetColor( Color( 255, 255, 255, 200 ) )
	self.Desc:SetText( "Kill 15 pigeons with a shotgun bitch"  )
	
	self.Icon = vgui.Create( "AchievementIcon", self )
	self.Icon:SetBGColor( Color( 255, 0, 0, 255 ) );
	
	self.ProgressBar = vgui.Create( "DProgressBar", self )
	
	self:SetBackgroundColor( Color( 100, 100, 100, 255 ) )
	
end


function PANEL:SetContentsAlpha( alpha )
	
	self.m_bDull = true
	
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:SetNumber( i )
	self.Name:SetText( tostring( achievements.GetName( i ) or "STEAM ERROR") )

	self.Desc:SetText( tostring( achievements.GetDesc( i ) or "Fantastic") )
	
	self:SetSize( 74, 74 )
	
	self.Icon:SetAchievement( i )
	
	self.ProgressBar:SetVisible( false )
	
	local iCount = achievements.GetCount( i )
	local iGoal = achievements.GetGoal( i )
	
	if ( iGoal > 1 ) then
		self.ProgressBar:SetVisible( true )
		self.ProgressBar:SetMin( 0 )
		self.ProgressBar:SetMax( iGoal )
		self.ProgressBar:SetValue( iCount )
	end
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:PerformLayout()

	self.Icon:SetPos( 5, 5 )
	self.Icon:SetSize( 64, 64 )
	
	self.Name:SizeToContents()
	self.Name:AlignTop( 5 )
	self.Name:MoveRightOf( self.Icon, 10 )
	self.Name:SetZPos( 100 )
	
	self.Desc:SizeToContents()
	self.Desc:CopyPos( self.Name )
	self.Desc:MoveBelow( self.Name, 0 )
	
	self.ProgressBar:SetPos( 10, 10 )
	self.ProgressBar:SetSize( 20, 20 )
	self.ProgressBar:AlignBottom( 5 )
	self.ProgressBar:MoveRightOf( self.Icon, 10 )
	self.ProgressBar:StretchToParent( nil, nil, 10, nil )
	
	
end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:PaintOver()
	
	if ( self.m_bDull ) then
		draw.RoundedBox( 4, 0, 0, self:GetWide(), self:GetTall(), Color( 100, 100, 100, 200 ) )
	end
	
end

vgui.Register( "AchievementPanel", PANEL, "DPanel" )