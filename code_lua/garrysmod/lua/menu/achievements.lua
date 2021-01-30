//=============================================================================//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2009
//										 
//=============================================================================//

include( "achievement_panel.lua" )

language.Add( "AchievementsTitle", "Achievements" )

local PANEL = {}

/*---------------------------------------------------------
	Init
---------------------------------------------------------*/
function PANEL:Init()

	self:SetMouseInputEnabled( true )
	self:SetKeyboardInputEnabled( true )
	self:SetDeleteOnClose( true )
	self:SetSizable( true )
	
	self:SetTitle( "#Achievements" )
	
	self:CreateControls()
	
end


/*---------------------------------------------------------
	CreateControls
---------------------------------------------------------*/
function PANEL:CreateControls()

	self.PanelList = vgui.Create( "DPanelList", self )
	self.PanelList:SetSpacing( 5 )
	self.PanelList:SetPadding( 5 )
	self.PanelList:EnableVerticalScrollbar()
	
	local fTotal = 0
	local fAttained = 0
	local iUnlocked = 0;
	
	local iCount = achievements.Count();
		
	for i=1, iCount-1 do
		
		fTotal = fTotal + 1
			
		local iCount = achievements.GetCount( i )
		local iGoal = achievements.GetGoal( i )
		local bAchieved = achievements.IsAchieved( i )
		
		local ach = vgui.Create( "AchievementPanel" )
		ach:SetNumber( i )
		self.PanelList:AddItem( ach )
				
		if ( bAchieved ) then
			fAttained = fAttained + 1;
			iUnlocked = iUnlocked + 1;
		else
			fAttained = fAttained + (iCount / iGoal);
			ach:SetContentsAlpha( 100 )
		end
			
	end
	
	self.ProgressPanel = vgui.Create( "DPanel", self )
	
	
	self.TotalProgress = vgui.Create( "DProgressBar", self.ProgressPanel )
	self.TotalProgress:SetSize( 200, 100 )
	self.TotalProgress:LabelAsPecentage()
	self.TotalProgress:SetMin( 0 )
	self.TotalProgress:SetMax( fTotal )
	self.TotalProgress:SetValue( fAttained )
	
	self.ProgressLabel = vgui.Create( "DLabel", self.ProgressPanel )
	self.ProgressLabel:SetFont( "Trebuchet18" )
	self.ProgressLabel:SetColor( Color( 255, 255, 255, 255 ) )
	self.ProgressLabel:SetText( Format( "You have unlocked %i out of %i achievements!", iUnlocked, fTotal ) )
	
end

/*---------------------------------------------------------
	PerformLayout
---------------------------------------------------------*/
function PANEL:PerformLayout()

	self.BaseClass.PerformLayout( self )
	
	self.ProgressPanel:SetTall( 55 )
	self.ProgressPanel:StretchToParent( 10, 30, 10, nil )
	self.ProgressPanel:SetBackgroundColor( Color( 70, 70, 70, 230 ) )

	self.ProgressLabel:SizeToContents()	
	self.ProgressLabel:SetPos( 5, 5 )
	self.ProgressLabel:CenterHorizontal()
	
	self.TotalProgress:SetTall( 22 )
	self.TotalProgress:StretchToParent( 6, nil, 6, nil )
	self.TotalProgress:AlignBottom( 6 )
	
	self.PanelList:MoveBelow( self.ProgressPanel, 5 )
	self.PanelList:StretchToParent( 10, nil, 10, 10 )

end


vgui.Register( "Achievements", PANEL, "DFrame" )


local function menu_achievements()

	if ( AchievementsWindow ) then
		AchievementsWindow:Remove()
		AchievementsWindow = nil
	end
	
	AchievementsWindow = vgui.Create( "Achievements" )
	AchievementsWindow:SetVisible( true )
	AchievementsWindow:SetSize( 500, 600 )
	AchievementsWindow:Center()
	AchievementsWindow:MakePopup()
	
end

concommand.Add( "menu_achievements", menu_achievements )