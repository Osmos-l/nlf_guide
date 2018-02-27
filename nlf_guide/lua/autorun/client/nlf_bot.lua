surface.CreateFont( "nlf_bot_panel", {
	font = "CloseCaption_Normal",
	size = 24,
	weight = 1000
} )

surface.CreateFont( "nlf_bot_textprincipal", {
	font = "CloseCaption_BoldItalic",
	size = 22,
	weight = 1000
} )

surface.CreateFont( "nlf_bot_textdelete", {
	font = "CloseCaption_Normal",
	size = 12,
	weight = 800
} )


local loc =  nlf.bot.config.llanguage.LocalLang

local blur = Material("pp/blurscreen")

local function blurPanel(HtmlPanel, amount)
    local x, y = HtmlPanel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, 6 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

local function DrawPopUpUrlFrame( )
		local frame = vgui.Create("DFrame")
		frame:SetTitle("")
		frame:SetSize(ScrW()/1.5, ScrH() /1.5)
		frame:SetAlpha(0)
		frame:AlphaTo(255, 0.25)
		frame:Center()
		frame:ShowCloseButton(false)
		frame:MakePopup()
		frame.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255) )
			draw.RoundedBox(0, 0, 0, w, 30, nlf.bot.config.popup.nameframecolor )
		
			draw.DrawText(nameframepopup, "nlf_bot_textprincipal", self:GetWide()/2, 4, nlf.bot.config.popup.nameframetextcolor, TEXT_ALIGN_CENTER)
			draw.DrawText( nlf.bot.config.llanguage[loc].nlfbotl26, "nlf_bot_textprincipal", self:GetWide()/2, self:GetTall()/2, nlf.bot.config.popup.nameframetextcolor, TEXT_ALIGN_CENTER)
 
			surface.SetDrawColor( 0, 0, 0 )
			surface.DrawOutlinedRect( 0, 0, w, h )
		end
	
		local but = vgui.Create( "DButton", frame )
		but:SetColor(nlf.bot.config.popup.exitButtonColor)
		but:SetText(nlf.bot.config.popup.exitname)
		but:SetTextColor(nlf.bot.config.popup.exitnamecolor)
		but:SetFont("nlf_bot_textprincipal")
		but:SetSize(0, 37)
		but:Dock(BOTTOM)
		but.DoClick = function()
			frame:Close()            
		end
		but.Paint = function(self, w, h)
			local bcol
           
			if self.Hovered then
				bcol = nlf.bot.config.popup.exitButtonColorWhenCursor
			else
			bcol = nlf.bot.config.popup.exitButtonColor
			end
				draw.RoundedBox(0, 0, 0, w, h, bcol)
			
				surface.SetDrawColor( 0, 0, 0 )
				surface.DrawOutlinedRect( 0, 0, w, h )
			end
		
		local html = vgui.Create("DHTML", frame)
	html:Dock( FILL )
	html:OpenURL( openurl )
	html:SetAllowLua( true )
		
		end 

local function DrawPopUpFrame()
		local frame = vgui.Create("DFrame")
		frame:SetTitle("")
		frame:SetSize(ScrW()*0.3, ScrH() *0.4)
		frame:SetAlpha(0)
		frame:AlphaTo(255, 0.25)
		frame:Center()
		frame:ShowCloseButton(false)
		frame:MakePopup()
		frame.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255) )
			draw.RoundedBox(0, 0, 0, w, 30, nlf.bot.config.popup.nameframecolor )
		
			draw.DrawText(nameframepopup, "nlf_bot_textprincipal", self:GetWide()/2, 4, nlf.bot.config.popup.nameframetextcolor, TEXT_ALIGN_CENTER)
 
			surface.SetDrawColor( 0, 0, 0 )
			surface.DrawOutlinedRect( 0, 0, w, h )
		end
	
		local but = vgui.Create( "DButton", frame )
		but:SetColor(nlf.bot.config.popup.exitButtonColor)
		but:SetText(nlf.bot.config.popup.exitname)
		but:SetTextColor(nlf.bot.config.popup.exitnamecolor)
		but:SetFont("nlf_bot_textprincipal")
		but:SetSize(0, 37)
		but:Dock(BOTTOM)
		but.DoClick = function()
			frame:Close()            
		end
		but.Paint = function(self, w, h)
			local bcol
           
			if self.Hovered then
				bcol = nlf.bot.config.popup.exitButtonColorWhenCursor
			else
			bcol = nlf.bot.config.popup.exitButtonColor
			end
				draw.RoundedBox(0, 0, 0, w, h, bcol)
			
				surface.SetDrawColor( 0, 0, 0 )
				surface.DrawOutlinedRect( 0, 0, w, h )
			end
		
		local dl = vgui.Create( "RichText", frame )
		dl:Dock(FILL)
		dl:InsertColorChange( 255, 255, 255, 255 )
		dl:AppendText( TEXTFRAME )
		dl:SetFontInternal("nlf_bot_textprincipal")
		dl:SetVerticalScrollbarEnabled( true )
		
		function dl:PerformLayout()

			self:SetFontInternal("nlf_bot_textprincipal")

		end
		
	end		
		
net.Receive("nlfbotpanel", function(ply)

	if nlf.bot.config.panel.usemusic then 
		if nlf.bot.config.panel.usefilemusic then 
			sound.PlayFile( nlf.bot.config.panel.filemusic, "", function( station )
				if ( IsValid( station ) ) then audio = station station:Play() end
			end )
		else 
			sound.PlayURL ( nlf.bot.config.panel.filemusic, "", function( station )
				if ( IsValid( station ) ) then audio = station station:Play() end
			end )
			
		
		end 
	end 

local HtmlPanel = vgui.Create("DFrame")
HtmlPanel:SetSize(960, 560) 
HtmlPanel:Center()
HtmlPanel:SetTitle("")
HtmlPanel:SetVisible(true)
HtmlPanel:SetDraggable(true)
HtmlPanel:ShowCloseButton(false)
HtmlPanel:MakePopup()

HtmlPanel.Paint = function(self, w, h)
    blurPanel(self, 5)
    draw.RoundedBox(10, 0, 0, w, h, nlf.bot.config.panel.blurbackgroundColor)
    draw.SimpleText(nlf.bot.config.panel.namebot, "nlf_bot_panel", HtmlPanel:GetWide() - 550, 15, nlf.bot.config.panel.namebotcolor)
    surface.SetDrawColor(Color(242, 242, 242, 255))
    surface.DrawLine(0, 43, HtmlPanel:GetWide(), 43)
end

local Icl = vgui.Create("DButton", HtmlPanel)
Icl:SetSize(50, 20)
Icl:SetPos(HtmlPanel:GetWide() - 50, 0)
Icl:SetText("X")
Icl:SetFont("fontclose")
Icl:SetTextColor(Color(255, 255, 255, 255))

Icl.Paint = function(self, w, h)
    local kcol

    if self.hover then
        kcol = Color(255, 150, 150, 255)
    else
        kcol = Color(175, 100, 100)
    end

    draw.RoundedBoxEx(0, 0, 0, w, h, Color(255, 150, 150, 255), false, false, true, true)
    draw.RoundedBoxEx(0, 1, 0, w - 2, h - 1, kcol, false, false, true, true)
end

Icl.DoClick = function()
		surface.PlaySound( nlf.bot.config.panel.soundonclick )
    HtmlPanel:Close()
	if nlf.bot.config.panel.usemusic and audio then 
		audio:Stop()
   end 
end

Icl.OnCursorEntered = function(self)
    self.hover = true
	surface.PlaySound( nlf.bot.config.panel.soundoncursor )
end

Icl.OnCursorExited = function(self)
    self.hover = false
end

local DPanelO = vgui.Create("DPanel", HtmlPanel)
DPanelO:SetPos(0, 44)
DPanelO:SetSize(HtmlPanel:GetWide(), 525 - 57)

DPanelO.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, DPanelO:GetWide(), DPanelO:GetTall(), nlf.bot.config.panel.backgroundColor)
	

    if nlf.bot.config.panel.useicon then
        local Rotating = math.sin(CurTime() * 3)
        local backwards = 0

        if Rotating < 0 then
            Rotating = 1 - (1 + Rotating)
            backwards = 0
        end

        surface.SetMaterial(Material(nlf.bot.config.icon.panelicon))
        surface.SetDrawColor(Color(242, 242, 242, 255))

        if nlf.bot.config.panel.iconrotating then
            surface.DrawTexturedRectRotated(DPanelO:GetWide() / 2, 30, Rotating * 65, 65, backwards)
 
        else
            surface.DrawTexturedRect(DPanelO:GetWide() / 2, 16, 65, 65)
        end
    end
end

	local DPanelB = vgui.Create("DPanel", HtmlPanel)
DPanelB:SetPos(0, 330)
DPanelB:SetSize(HtmlPanel:GetWide(), 225)
DPanelB.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, DPanelB:GetWide(), DPanelB:GetTall(), nlf.bot.config.panel.backgroundColor)
	end 

local scroll = vgui.Create("DScrollPanel", DPanelB)
	scroll:SetSize(811, 464)	
	scroll:Dock(FILL)
	local scrollbar = scroll:GetVBar()     
       
    function scrollbar:Paint( w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
    end
   
    function scrollbar.btnGrip:Paint( w, h )
        draw.RoundedBox( 0, 4, 0, w, h, nlf.bot.config.scrollbar )
    end
   
    function scrollbar.btnUp:Paint( w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
    end
   
    function scrollbar.btnDown:Paint( w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
    end

local IconModel = vgui.Create("DModelPanel", DPanelO)
IconModel:SetModel(nlf.bot.config.skin)
IconModel:SetPos(50, 70)
IconModel:SetSize(200, 200)

function IconModel:LayoutEntity(Entity)
    return
end


if table.HasValue(nlf.bot.config.adminpanel.access, LocalPlayer():GetUserGroup()) then 
local Acl = vgui.Create("DButton", HtmlPanel)
Acl:SetSize(50, 20)
Acl:SetPos( 0, 0)
Acl:SetText(nlf.bot.config.llanguage[loc].nlfbotl78)
Acl:SetFont("fontclose")
Acl:SetTextColor(Color(255, 255, 255, 255))

Acl.Paint = function(self, w, h)
    local kcol

    if self.hover then
        kcol = Color(255, 150, 150, 255)
    else
        kcol = Color(175, 100, 100)
    end

    draw.RoundedBoxEx(0, 0, 0, w, h, Color(255, 150, 150, 255), false, false, true, true)
    draw.RoundedBoxEx(0, 1, 0, w - 2, h - 1, kcol, false, false, true, true)
end

Acl.DoClick = function()
		surface.PlaySound( nlf.bot.config.panel.soundonclick )
   		net.Start( "nlfadminpanel" )
		net.SendToServer(ply) 
		
end

Acl.OnCursorEntered = function(self)
    self.hover = true
	surface.PlaySound( nlf.bot.config.panel.soundoncursor )
end

Acl.OnCursorExited = function(self)
    self.hover = false
end

end

local headpos = IconModel.Entity:GetBonePosition(IconModel.Entity:LookupBone("ValveBiped.Bip01_Head1"))
IconModel:SetLookAt(headpos)
IconModel:SetCamPos(headpos - Vector(-15, 0, 0))
IconModel.Entity:SetEyeTarget(headpos - Vector(-15, 0, 0))

local text_panel = vgui.Create("DLabel", DPanelO)
text_panel:SetPos(275, 70)
text_panel:SetSize(HtmlPanel:GetWide() - 275, 200)
text_panel:SetFont("nlf_bot_textprincipal")
text_panel:SetText(nlf.bot.config.panel.textprincipal)
text_panel:SetTextColor(nlf.bot.config.panel.textprincipalColor)
text_panel:SetWrap(true)

local AddButoon = 0

for k, v in pairs(nlf.bot.config.button) do
        if v.name == nil then return false end
        if v.action == nil then return false end
        local DermaR1Button = vgui.Create("DButton", scroll)
        DermaR1Button:SetText(v.name)
        DermaR1Button:SetFont("nlf_bot_panel")
        DermaR1Button:SetTextColor(nlf.bot.config.button.namecolor)
        DermaR1Button:SetPos(24, 0 + AddButoon)
        DermaR1Button:SetSize(HtmlPanel:GetWide() - 50, 30)

        DermaR1Button.Paint = function(self, w, h)
            draw.RoundedBox(4, 2, 2, w - 4, h - 4, nlf.bot.config.button.buttonColor)

            if self.hover then
                draw.RoundedBox(4, 1, 1, w - 2, h - 2, nlf.bot.config.button.cursorenteredColor)
            end
        end

        DermaR1Button.DoClick = function(panel, id)
		surface.PlaySound( nlf.bot.config.panel.soundonclick )
            nameframepopup = DermaR1Button:GetText()
            if v.action == "txt" then
                TEXTFRAME = v.text
                DrawPopUpFrame()
            elseif v.action == "urlweb" then
                gui.OpenURL(v.text)
            elseif v.action == "url" then
                openurl = v.text
                DrawPopUpUrlFrame()
            elseif v.action == "givemoneyonetime" then
                net.Start("givemoneyonetime")
				net.WriteUInt(k, 16)
                net.SendToServer(ply)
			elseif v.action == "playsoundfile" then
              myfilesound = v.text
				sound.PlayFile( myfilesound, "", function( station )
				if ( IsValid( station ) ) then station:Play() end
				end ) 
            elseif v.action == "exit" then
                HtmlPanel:Close()
                if audio then 
					audio:Stop()
				end 
            end
        end

        DermaR1Button.OnCursorEntered = function(self)
            self.hover = true
			surface.PlaySound( nlf.bot.config.panel.soundoncursor )
        end

        DermaR1Button.OnCursorExited = function(self)
            self.hover = false
        end

        AddButoon = AddButoon + 30
end
end)

local function DeleteChoice()
						local frame1 = vgui.Create("DFrame")
							frame1:SetTitle("")
							frame1:SetSize(500, 300)
							frame1:SetAlpha(0)
							frame1:AlphaTo(255, 0.25)
							frame1:Center()
							frame1:ShowCloseButton(true)
							frame1:MakePopup()
							frame1.Paint = function(self, w, h)
							draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255) )
							draw.RoundedBox(0, 0, 0, w, 30,  Color(226, 0, 0, 250) )
		
							draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl48, "nlf_bot_textprincipal", self:GetWide()/2, 4, color_white, TEXT_ALIGN_CENTER)
							draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl49, "nlf_bot_textdelete", self:GetWide()/2, 115, color_white, TEXT_ALIGN_CENTER)
 
							surface.SetDrawColor( 0, 0, 0 )
							surface.DrawOutlinedRect( 0, 0, w, h )
							end 
							local TestingComboBox = vgui.Create( "DComboBox", frame1 )
								TestingComboBox:SetPos( frame1:GetWide()/4, 40 )
								TestingComboBox:SetSize( 200, 30 )
								TestingComboBox:SetValue( nlf.bot.config.llanguage[loc].nlfbotl50 ) -- ton choix
								TestingComboBox:AddChoice( nlf.bot.config.llanguage[loc].nlfbotl51 ) -- 1 bot
								TestingComboBox:AddChoice( nlf.bot.config.llanguage[loc].nlfbotl52 ) -- 1 Client
								TestingComboBox:AddChoice( nlf.bot.config.llanguage[loc].nlfbotl53 )-- tout bots
								TestingComboBox:AddChoice( nlf.bot.config.llanguage[loc].nlfbotl54 ) -- tout clients
								TestingComboBox:AddChoice( nlf.bot.config.llanguage[loc].nlfbotl55 ) -- tout
								TestingComboBox.OnSelect = function( panel, index, value )
								whatdelete	=	value
									end
									
					local TextEntryID = vgui.Create( "DTextEntry", frame1 ) 
						TextEntryID:SetPos( frame1:GetWide()/4, 130 )
						TextEntryID:SetSize( 300,  30)
						TextEntryID:SetText( nlf.bot.config.llanguage[loc].nlfbotl56 )
			
									
					local YEScl = vgui.Create( "DButton", frame1 )
					YEScl:SetSize( 300, 50 )
					YEScl:SetPos( frame1:GetWide()/4, 230 )
					YEScl:SetText( nlf.bot.config.llanguage[loc].nlfbotl57 )
					YEScl:SetFont( "fontclose" )
					YEScl:SetTextColor( Color( 0, 0, 0, 255 ) )
					YEScl.Paint = function( self, w, h )
					local kcol
					if self.hover then
						kcol = Color( 200, 200, 200, 255 )
					else
						kcol = Color( 255, 255, 255 )
					end
						draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
						draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
						
					end
					YEScl.DoClick = function()
							surface.PlaySound( nlf.bot.config.panel.soundonclick )
					if whatdelete == nlf.bot.config.llanguage[loc].nlfbotl51 then -- 1 bot
					net.Start("deleteonebot")
					net.WriteString(TextEntryID:GetValue())
					net.SendToServer(ply)
					elseif whatdelete == nlf.bot.config.llanguage[loc].nlfbotl52 then -- 1 client
					net.Start("deleteonedataclient")
					net.WriteString(TextEntryID:GetValue())
					net.SendToServer(ply)
					elseif whatdelete == nlf.bot.config.llanguage[loc].nlfbotl53 then -- tout bot
					net.Start("deleteallbot")
					net.SendToServer(ply)
					elseif whatdelete == nlf.bot.config.llanguage[loc].nlfbotl54 then -- tout clients
					net.Start("deletealldataclient")
					net.SendToServer(ply)
					elseif whatdelete == nlf.bot.config.llanguage[loc].nlfbotl55 then	 -- tout
					net.Start("deletealldataclient")
					net.SendToServer(ply)
					net.Start("deleteallbot")
					net.SendToServer(ply)
					end 
					
					frame1:Close()
					end
					YEScl.OnCursorEntered = function( self )
						self.hover = true
							surface.PlaySound( nlf.bot.config.panel.soundoncursor )
					end
					YEScl.OnCursorExited = function( self )
						self.hover = false
					end
									
end 

local function ShowDataNPC()

 local frame1 = vgui.Create("DFrame")
    frame1:SetTitle("")
    frame1:SetSize(400, 300)
    frame1:SetAlpha(0)
    frame1:AlphaTo(255, 0.25)
    frame1:Center()
    frame1:ShowCloseButton(true)
    frame1:MakePopup()

    frame1.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255))
        draw.RoundedBox(0, 0, 0, w, 30, Color(226, 0, 0, 250))
        draw.DrawText("NLF BOT : Données BOT", "nlf_bot_textprincipal", self:GetWide() / 2, 4, color_white, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(0, 0, 0)
        surface.DrawOutlinedRect(0, 0, w, h)
		
    end

	 local DataBotList = vgui.Create("DListView", frame1)
    DataBotList:Dock(FILL)
    DataBotList:DockMargin(5, 5, 5, 5)
    DataBotList:SetWidth(565)
    DataBotList:SetMultiSelect(false)
    DataBotList:AddColumn("Nom du bot")
	DataBotList.OnRowRightClick = function(DataBotList, line)
        local DropDown = DermaMenu()

        DropDown:AddOption(nlf.bot.config.llanguage[loc].nlfbotl51, function()
            BotDelete = tostring(DataBotList:GetLine(line):GetValue(1))
            net.Start("deletebotshowdata")
            net.WriteString(BotDelete)
            net.SendToServer(ply)
            DataBotList:Clear()
        end)

        DropDown:AddSpacer()
        DropDown:Open()
    end
	
	  net.Receive("sendbotdata", function()
        local Namebot = net.ReadTable()
        DataBotList:Clear()
     
       for k,v in pairs(Namebot) do
              DataBotList:AddLine(tostring(v))
       end
    end)
	
end 

local function ShowData()
    local frame1 = vgui.Create("DFrame")
    frame1:SetTitle("")
    frame1:SetSize(900, 600)
    frame1:SetAlpha(0)
    frame1:AlphaTo(255, 0.25)
    frame1:Center()
    frame1:ShowCloseButton(true)
    frame1:MakePopup()

    frame1.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255))
        draw.RoundedBox(0, 0, 0, w, 30, Color(226, 0, 0, 250))
        draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl58, "nlf_bot_textprincipal", self:GetWide() / 2, 4, color_white, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(0, 0, 0)
        surface.DrawOutlinedRect(0, 0, w, h)
		
		surface.SetMaterial( Material( nlf.bot.config.icon.search ) )
		surface.SetDrawColor( Color( 242, 242, 242, 255) )
		surface.DrawTexturedRect( 210, 55, 25, 25 )	
    end

    local DataList = vgui.Create("DListView", frame1)
    DataList:Dock(FILL)
    DataList:DockMargin(250, 5, 5, 5)
    DataList:SetWidth(565)
    DataList:SetMultiSelect(false)
    DataList:AddColumn(nlf.bot.config.llanguage[loc].nlfbotl59):SetFixedWidth(200)
    DataList:AddColumn(nlf.bot.config.llanguage[loc].nlfbotl60)
    DataList:AddColumn(nlf.bot.config.llanguage[loc].nlfbotl61):SetFixedWidth(120)
	DataList.OnRowRightClick = function(DataList, line)
        local DropDown = DermaMenu()

        DropDown:AddOption(nlf.bot.config.llanguage[loc].nlfbotl62, function()
            LocalSteamID = tostring(DataList:GetLine(line):GetValue(1))
            net.Start("deleteonedataclient")
            net.WriteString(LocalSteamID)
            net.SendToServer(ply)
            DataList:Clear()
        end)

        DropDown:AddSpacer()
        DropDown:Open()
    end
    local OFFEntry = vgui.Create("DTextEntry", frame1)
    OFFEntry:SetPos(235, 50)
    OFFEntry:SetSize(200, 30)
    OFFEntry:SetText(nlf.bot.config.llanguage[loc].nlfbotl63)
	
    local Vcl = vgui.Create("DButton", frame1)
    Vcl:SetSize(200, 30)
    Vcl:SetPos(235, 90)
    Vcl:SetText(nlf.bot.config.llanguage[loc].nlfbotl57)
    Vcl:SetFont("fontclose")
    Vcl:SetTextColor(Color(255, 255, 255, 255))
    Vcl.Paint = function(self, w, h)
        local kcol

        if self.hover then
            kcol = Color(255, 150, 150, 255)
        else
            kcol = Color(175, 100, 100)
        end

        draw.RoundedBoxEx(0, 0, 0, w, h, Color(255, 150, 150, 255), false, false, true, true)
        draw.RoundedBoxEx(0, 1, 0, w - 2, h - 1, kcol, false, false, true, true)
    end

    Vcl.DoClick = function()
			surface.PlaySound( nlf.bot.config.panel.soundonclick )
        local offlinesteamsearch = OFFEntry:GetText()
        DataList:Clear()
			net.Start("findofflineclientdata")
    		net.WriteString( offlinesteamsearch )
    		net.SendToServer(ply)
    end

    		
    Vcl.OnCursorEntered = function(self)
        self.hover = true
			surface.PlaySound( nlf.bot.config.panel.soundoncursor )
    end

    Vcl.OnCursorExited = function(self)
        self.hover = false
    end

	local Bcl = vgui.Create("DButton", frame1)
    Bcl:SetSize(200, 30)
    Bcl:SetPos(235, 150)
    Bcl:SetText("Voir les données npc")
    Bcl:SetFont("fontclose")
    Bcl:SetTextColor(Color(255, 255, 255, 255))
    Bcl.Paint = function(self, w, h)
        local kcol

        if self.hover then
            kcol = Color(255, 150, 150, 255)
        else
            kcol = Color(175, 100, 100)
        end

        draw.RoundedBoxEx(0, 0, 0, w, h, Color(255, 150, 150, 255), false, false, true, true)
        draw.RoundedBoxEx(0, 1, 0, w - 2, h - 1, kcol, false, false, true, true)
    end

    Bcl.DoClick = function()
			surface.PlaySound( nlf.bot.config.panel.soundonclick )
	ShowDataNPC()
     net.Start("findbotdata")
    net.SendToServer(ply)
    end

    		
    Bcl.OnCursorEntered = function(self)
        self.hover = true
			surface.PlaySound( nlf.bot.config.panel.soundoncursor )
    end

    Bcl.OnCursorExited = function(self)
        self.hover = false
    end
	
    local PlayerList = vgui.Create("DListView", frame1)
    PlayerList:Dock(LEFT)
    PlayerList:DockMargin(5, 5, 5, 5)
    PlayerList:SetWidth(200)
    PlayerList:SetMultiSelect(false)
    PlayerList:AddColumn(nlf.bot.config.llanguage[loc].nlfbotl64)

    PlayerList.OnRowSelected = function(PlayerList, line)
        DataList:Clear()
        net.Start("findclientdata")
        net.WriteString("playername")
        net.WriteString(tostring(PlayerList:GetLine(line):GetValue(1)))
        net.SendToServer(ply)
    end


    net.Receive("showclientdata", function()
        local ClientSteamID = net.ReadString()
        local ClientName = net.ReadString()
        local ClientAmount = net.ReadString()
        DataList:Clear()
        DataList:AddLine(ClientSteamID, ClientName, ClientAmount)
    end)

    for _, v in pairs(player.GetAll()) do
        PlayerList:AddLine(v:Nick())
    end
end

local function ShowCredit()

local frame1 = vgui.Create("DFrame")
    frame1:SetTitle("")
    frame1:SetSize(400, 400)
    frame1:SetAlpha(0)
    frame1:AlphaTo(255, 0.25)
    frame1:Center()
    frame1:ShowCloseButton(false)
    frame1:MakePopup()

    frame1.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255))
        draw.RoundedBox(0, 0, 0, w, 30, Color(226, 0, 0, 250))
		
        draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl65, "nlf_bot_textprincipal", self:GetWide() / 2, 4, color_white, TEXT_ALIGN_CENTER)
		
		draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl66..nlf.bot.version, "nlf_bot_textprincipal", self:GetWide() / 2, 50, color_white, TEXT_ALIGN_CENTER)
		
		draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl67 .." Osmos Kesko", "nlf_bot_textprincipal", self:GetWide() / 2, 100, color_white, TEXT_ALIGN_CENTER)
		
		draw.DrawText("Néo-Life Community", "nlf_bot_textprincipal", self:GetWide() / 2, 120, color_white, TEXT_ALIGN_CENTER)
		
		draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl68.. " Osmos Kesko", "nlf_bot_textprincipal", self:GetWide() / 2, 170, color_white, TEXT_ALIGN_CENTER)
		
		draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl69.. " Osmos Kesko", "nlf_bot_textprincipal", self:GetWide() / 2, 190, color_white, TEXT_ALIGN_CENTER)
		
        surface.SetDrawColor(0, 0, 0)
        surface.DrawOutlinedRect(0, 0, w, h)
		
		surface.SetMaterial( Material( nlf.bot.config.icon.creator ) )
		surface.SetDrawColor( Color( 242, 242, 242, 255) )
		surface.DrawTexturedRect( self:GetWide() / 3, 250, 150, 150 )
    end

	local LEAVEcl = vgui.Create( "DButton", frame1 )
					LEAVEcl:SetSize( 50, 20 )
					LEAVEcl:SetPos( frame1:GetWide() - 50, 0 )
					LEAVEcl:SetText( "X" )
					LEAVEcl:SetFont( "fontclose" )
					LEAVEcl:SetTextColor( Color( 255, 255, 255, 255 ) )
					LEAVEcl.Paint = function( self, w, h )
					local kcol
					if self.hover then
						kcol = Color( 255, 150, 150, 255 )
					else
						kcol = Color( 175, 100, 100 )
					end
						draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
						draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
						
					end
					LEAVEcl.DoClick = function()
							surface.PlaySound( nlf.bot.config.panel.soundonclick )
						frame1:Close()
					end
					LEAVEcl.OnCursorEntered = function( self )
						self.hover = true
							surface.PlaySound( nlf.bot.config.panel.soundoncursor )
					end
					LEAVEcl.OnCursorExited = function( self )
						self.hover = false
					end
	
end 

local function newBot()

			
						local frame1 = vgui.Create("DFrame")
							frame1:SetTitle("")
							frame1:SetSize(500, 300)
							frame1:SetAlpha(0)
							frame1:AlphaTo(255, 0.25)
							frame1:Center()
							frame1:ShowCloseButton(true)
							frame1:MakePopup()
							frame1.Paint = function(self, w, h)
							draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255) )
							draw.RoundedBox(0, 0, 0, w, 30,  Color(226, 0, 0, 250) )
		
							draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl70, "nlf_bot_textprincipal", self:GetWide()/2, 4, color_white, TEXT_ALIGN_CENTER)
							draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl71, "nlf_bot_textdelete", self:GetWide()/2, 115, color_white, TEXT_ALIGN_CENTER)
 
							surface.SetDrawColor( 0, 0, 0 )
							surface.DrawOutlinedRect( 0, 0, w, h )
							end 
						
									
					local TextEntryID = vgui.Create( "DTextEntry", frame1 ) 
						TextEntryID:SetPos( frame1:GetWide()/4, 130 )
						TextEntryID:SetSize( 300,  30)
						TextEntryID:SetText( nlf.bot.config.llanguage[loc].nlfbotl72 )
			
									
					local YEScl = vgui.Create( "DButton", frame1 )
					YEScl:SetSize( 300, 50 )
					YEScl:SetPos( frame1:GetWide()/4, 230 )
					YEScl:SetText( nlf.bot.config.llanguage[loc].nlfbotl57 )
					YEScl:SetFont( "fontclose" )
					YEScl:SetTextColor( Color( 0, 0, 0, 255 ) )
					YEScl.Paint = function( self, w, h )
					local kcol
					if self.hover then
						kcol = Color( 200, 200, 200, 255 )
					else
						kcol = Color( 255, 255, 255 )
					end
						draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
						draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
						
					end
					YEScl.DoClick = function()
							surface.PlaySound( nlf.bot.config.panel.soundonclick )
					local npcname = TextEntryID:GetText()
					net.Start("spawnbotpanel")
					net.WriteString(npcname)
					net.SendToServer(ply)
					frame1:Close()
					end
					YEScl.OnCursorEntered = function( self )
						self.hover = true
							surface.PlaySound( nlf.bot.config.panel.soundoncursor )
					end
					YEScl.OnCursorExited = function( self )
						self.hover = false
					end
									
end 

net.Receive("nlfadminpanel", function()

local frame = vgui.Create("DFrame")
		frame:SetTitle("")
		frame:SetSize(500, 450)
		frame:SetAlpha(0)
		frame:AlphaTo(255, 0.25)
		frame:Center()
		frame:ShowCloseButton(false)
		frame:MakePopup()
		frame.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 230) )
			draw.RoundedBox(0, 0, 0, w, 30,  Color(226, 0, 0, 230) )
		
			draw.DrawText(nlf.bot.config.llanguage[loc].nlfbotl73, "nlf_bot_textprincipal", self:GetWide()/2, 4, color_white, TEXT_ALIGN_CENTER)
 
			surface.SetDrawColor( 0, 0, 0 )
			surface.DrawOutlinedRect( 0, 0, w, h )
			
		surface.SetMaterial( Material( nlf.bot.config.icon.create ) ) 
		surface.SetDrawColor( Color( 242, 242, 242, 255) )
		surface.DrawTexturedRect( frame:GetWide()/9, 105, 65, 65 )	
			
		surface.SetMaterial( Material( nlf.bot.config.icon.delete ) )
		surface.SetDrawColor( Color( 242, 242, 242, 255) )
		surface.DrawTexturedRect( frame:GetWide()/9, 325, 65, 65 )	
		
		surface.SetMaterial( Material( nlf.bot.config.icon.showdata ) )
		surface.SetDrawColor( Color( 242, 242, 242, 255) )
		surface.DrawTexturedRect(  frame:GetWide()/9, 215, 65, 65 )	
		end 
		
					local Ccl = vgui.Create( "DButton", frame )

					Ccl:SetSize( 50, 20 )
					Ccl:SetPos( frame:GetWide() - 50, 0 )
					Ccl:SetText( "X" )
					Ccl:SetFont( "fontclose" )
					Ccl:SetTextColor( Color( 255, 255, 255, 255 ) )
					Ccl.Paint = function( self, w, h )
					local kcol
					if self.hover then
						kcol = Color( 255, 150, 150, 255 )
					else
						kcol = Color( 175, 100, 100 )
					end
						draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
						draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
						
					end
					Ccl.DoClick = function()
							surface.PlaySound( nlf.bot.config.panel.soundonclick )
					frame:Close()
					end
					Ccl.OnCursorEntered = function( self )
						self.hover = true
							surface.PlaySound( nlf.bot.config.panel.soundoncursor )
					end
					Ccl.OnCursorExited = function( self )
						self.hover = false
					end
		
			local CREDcl = vgui.Create( "DButton", frame )

					CREDcl:SetSize( 50, 20 )
					CREDcl:SetPos( 0, 0 )
					CREDcl:SetText( nlf.bot.config.llanguage[loc].nlfbotl74 ) 
					CREDcl:SetFont( "fontclose" )
					CREDcl:SetTextColor( Color( 255, 255, 255, 255 ) )
					CREDcl.Paint = function( self, w, h )
					local kcol
					if self.hover then
						kcol = Color( 255, 150, 150, 255 )
					else
						kcol = Color( 175, 100, 100 )
					end
						draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
						draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
						
					end
					CREDcl.DoClick = function()
					ShowCredit()
							surface.PlaySound( nlf.bot.config.panel.soundonclick )
					end
					CREDcl.OnCursorEntered = function( self )
						self.hover = true
							surface.PlaySound( nlf.bot.config.panel.soundoncursor )
					end
					CREDcl.OnCursorExited = function( self )
						self.hover = false
					end
					
					local ADDcl = vgui.Create( "DButton", frame )
					ADDcl:SetSize( 300, 100 )
					ADDcl:SetPos( frame:GetWide()/4, 80 )
					ADDcl:SetText( nlf.bot.config.llanguage[loc].nlfbotl75 )
					ADDcl:SetFont( "fontclose" )
					ADDcl:SetTextColor( Color( 0, 0, 0, 255 ) )
					ADDcl.Paint = function( self, w, h )
					local kcol
					if self.hover then
						kcol = Color( 200, 200, 200, 255 )
					else
						kcol = Color( 255, 255, 255 )
					end
						draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
						draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
						
					end
					ADDcl.DoClick = function()
					newBot()
							surface.PlaySound( nlf.bot.config.panel.soundonclick )
					end
					ADDcl.OnCursorEntered = function( self )
						self.hover = true
							surface.PlaySound( nlf.bot.config.panel.soundoncursor )
					end
					ADDcl.OnCursorExited = function( self )
						self.hover = false
					end			
					

		local PANcl = vgui.Create( "DButton", frame )
					PANcl:SetSize( 300, 100 )
					PANcl:SetPos( frame:GetWide()/4, 190 )
					PANcl:SetText( nlf.bot.config.llanguage[loc].nlfbotl76 )
					PANcl:SetFont( "fontclose" )
					PANcl:SetTextColor( Color( 0, 0, 0, 255 ) )
					PANcl.Paint = function( self, w, h )
					local kcol
					if self.hover then
						kcol = Color( 200, 200, 200, 255 )
					else
						kcol = Color( 255, 255, 255 )
					end
						draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
						draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
						
					end
					PANcl.DoClick = function()
					ShowData()
							surface.PlaySound( nlf.bot.config.panel.soundonclick )
					end
					PANcl.OnCursorEntered = function( self )
						self.hover = true
							surface.PlaySound( nlf.bot.config.panel.soundoncursor )
					end
					PANcl.OnCursorExited = function( self )
						self.hover = false
					end			
		
		local DELcl = vgui.Create( "DButton", frame )
					DELcl:SetSize( 300, 100 )
					DELcl:SetPos( frame:GetWide()/4, 300 )
					DELcl:SetText( nlf.bot.config.llanguage[loc].nlfbotl77 )
					DELcl:SetFont( "fontclose" )
					DELcl:SetTextColor( Color( 0, 0, 0, 255 ) )
					DELcl.Paint = function( self, w, h )
					local kcol
					if self.hover then
						kcol = Color( 200, 200, 200, 255 )
					else
						kcol = Color( 255, 255, 255 )
					end
						draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
						draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
						
					end
					DELcl.DoClick = function()
						DeleteChoice()
								surface.PlaySound( nlf.bot.config.panel.soundonclick )
					end
					DELcl.OnCursorEntered = function( self )
						self.hover = true
								surface.PlaySound( nlf.bot.config.panel.soundoncursor )
					end
					DELcl.OnCursorExited = function( self )
						self.hover = false
					end
		
end ) 