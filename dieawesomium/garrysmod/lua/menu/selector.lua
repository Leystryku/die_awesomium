-- small, plain replacement for the html menu

if(controls and IsValid(controls)) then
	controls:SetVisible(false)
	controls = nil
end


surface.CreateFont( "menufont", {
font = "Arial",
size = ScrW()*0.016,
weight = 500
})

local function butt_updatecolors( self, skin )

	if ( self.Hovered ) then surface.PlaySound("garrysmod/ui_hover.wav") return self:SetTextStyleColor( Color(128,128,128,255) ) end

	return self:SetTextStyleColor(Color(255,255,255,255) )

end

controls = vgui.Create("DFrame")
controls:SetSize(ScrW()/5, ScrH()/2)
controls:SetPos(ScrW()/12.2, ScrH()/2)
controls:MakePopup()
controls.Paint = function() end
controls:SetTitle("")
controls.btnClose:SetVisible(false)
controls.btnMinim:SetVisible(false)	
controls.btnMaxim:SetVisible(false)

local y_pos = 0
controls.newgame = vgui.Create("DButton", controls)
controls.newgame:SetSize(ScrW()/5.5, 30)
controls.newgame:SetPos(0,y_pos)
controls.newgame:SetText("Start a Server")
controls.newgame:SetFont("menufont")
controls.newgame.Paint = function(pnl, w,h) end
controls.newgame.UpdateColours = butt_updatecolors
controls.newgame.DoClick = function(pnl)
	RunConsoleCommand("menu_play")
	surface.PlaySound("garrysmod/ui_click.wav")
end

local y_add =  ScrH()/30

y_pos = y_pos + y_add
controls.findgame = vgui.Create("DButton", controls)
controls.findgame:SetSize(ScrW()/5.5, 30)
controls.findgame:SetPos(0, y_pos)
controls.findgame:SetText("Find a Server")
controls.findgame:SetFont("menufont")
controls.findgame.Paint = function() end
controls.findgame.UpdateColours = butt_updatecolors
controls.findgame.DoClick = function(pnl)
	RunConsoleCommand("gamemenucommand openserverbrowser")
	surface.PlaySound("garrysmod/ui_click.wav")
end


y_pos = y_pos + y_add*3

controls.options = vgui.Create("DButton", controls)
controls.options:SetSize(ScrW()/5.5, 30)
controls.options:SetPos(0, y_pos)
controls.options:SetText("Options")
controls.options:SetFont("menufont")
controls.options.Paint = function() end
controls.options.UpdateColours = butt_updatecolors
controls.options.DoClick = function(pnl)
	RunConsoleCommand("gamemenucommand openoptionsdialog")
	surface.PlaySound("garrysmod/ui_click.wav")
end

y_pos = y_pos + y_add
controls.achievement = vgui.Create("DButton", controls)
controls.achievement:SetSize(ScrW()/5.5, 30)
controls.achievement:SetPos(0, y_pos)
controls.achievement:SetText("Achievements")
controls.achievement:SetFont("menufont")
controls.achievement.Paint = function() end
controls.achievement.UpdateColours = butt_updatecolors

controls.achievement.DoClick = function(pnl)
	RunConsoleCommand("menu_achievements")
	surface.PlaySound("garrysmod/ui_click.wav")
end

y_pos = y_pos + y_add

controls.addons = vgui.Create("DButton", controls)
controls.addons:SetSize(ScrW()/5.5, 30)
controls.addons:SetPos(0, y_pos)
controls.addons:SetText("Extensions")
controls.addons:SetFont("menufont")
controls.addons.Paint = function() end
controls.addons.UpdateColours = butt_updatecolors
controls.addons.DoClick = function(pnl)
	RunConsoleCommand("menu_extensions")
	surface.PlaySound("garrysmod/ui_click.wav")
end

y_pos = y_pos + y_add

controls.addons = vgui.Create("DButton", controls)
controls.addons:SetSize(ScrW()/5.5, 30)
controls.addons:SetPos(0, y_pos)
controls.addons:SetText("Workshop")
controls.addons:SetFont("menufont")
controls.addons.Paint = function() end
controls.addons.UpdateColours = butt_updatecolors
controls.addons.DoClick = function(pnl)
	gui.OpenURL("http://steamcommunity.com/app/4000/workshop/")
	surface.PlaySound("garrysmod/ui_click.wav")
end


y_pos = y_pos + y_add*2
controls.quit = vgui.Create("DButton", controls)
controls.quit:SetSize(ScrW()/5.5, 30)
controls.quit:SetPos(0, y_pos)
controls.quit:SetText("Quit")
controls.quit:SetFont("menufont")
controls.quit.Paint = function() end
controls.quit.UpdateColours = butt_updatecolors
controls.quit.DoClick = function(pnl)
	RunConsoleCommand("exit")
	surface.PlaySound("garrysmod/ui_click.wav")
end

local is_quit = true

hook.Add("DrawOverlay", "QuitThink", function()
	
	if(IsInGame()) then
		if(is_quit) then
			is_quit = false
			controls.quit:SetText("Disconnect")
			controls.quit.DoClick = function(pnl)
				RunConsoleCommand("disconnect")
				surface.PlaySound("garrysmod/ui_click.wav")
			end
		end
	else
		if(not is_quit) then
			is_quit = true
			controls.quit:SetText("Quit")
			controls.quit.DoClick = function(pnl)
				RunConsoleCommand("exit")
				surface.PlaySound("garrysmod/ui_click.wav")
			end
		end
	end
	
end)