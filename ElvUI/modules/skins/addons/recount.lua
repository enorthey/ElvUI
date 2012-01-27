local E, L, DF = unpack(select(2, ...)); --Engine
local S = E:GetModule('Skins')

local function SkinFrame(frame)
	frame.bgMain = CreateFrame("Frame", nil, frame)
	--frame.bgMain:SetTemplate("Transparent")
	frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
	frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
	frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -30)
	frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
	
	frame.bgTitle = CreateFrame('Frame', nil, frame)
	frame.bgTitle:SetTemplate('Default', true)
	frame.bgTitle:Point("TOPRIGHT", frame, "TOPRIGHT", 0, -10)
	frame.bgTitle:Point("TOPLEFT", frame, "TOPLEFT", 0, -6)
	frame.bgTitle:Point("BOTTOM", frame, "TOP", 0, -28)
	--frame.bgTitle.backdropTexture:SetVertexColor(unpack(E['media'].bordercolor))
	frame.bgTitle:SetFrameLevel(frame:GetFrameLevel())
	
	frame.CloseButton:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-1,-7)
	frame.CloseButton:SetNormalTexture("")
	frame.CloseButton:SetPushedTexture("")
	frame.CloseButton:SetHighlightTexture("")
	frame.CloseButton.t = frame.CloseButton:CreateFontString(nil, "OVERLAY")
	frame.CloseButton.t:FontTemplate(E["media"].dtFont, E.db.core.dtfontsize,  E.db.core.dtfontoutline)
	frame.CloseButton.t:SetPoint("CENTER", 0, 1)
	frame.CloseButton.t:SetText("X")
	
	S:HandleScrollBar(Recount_MainWindow_ScrollBarScrollBar)
	
	frame.Title:SetPoint("TOPLEFT",frame,"TOPLEFT",7,-11)
	frame.Title:FontTemplate(E["media"].dtFont, E.db.core.dtfontsize,  E.db.core.dtfontoutline)
	frame.Title:SetTextColor(unpack(E["media"].rgbvaluecolor))
	frame:SetBackdrop(nil)
end

local function SkinFrame2(frame)
	frame.bgMain = CreateFrame("Frame", nil, frame)
	frame.bgMain:SetTemplate("Default")
	frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
	frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
	frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -30)
	frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
	
	frame.bgTitle = CreateFrame('Frame', nil, frame)
	frame.bgTitle:SetTemplate('Default', true)
	frame.bgTitle:Point("TOPRIGHT", frame, "TOPRIGHT", 0, -10)
	frame.bgTitle:Point("TOPLEFT", frame, "TOPLEFT", 0, -6)
	frame.bgTitle:Point("BOTTOM", frame, "TOP", 0, -28)
	frame.bgTitle:SetFrameLevel(frame:GetFrameLevel())
	
	frame.CloseButton:SetPoint("TOPRIGHT",frame,"TOPRIGHT",-1,-7)
	frame.CloseButton:SetNormalTexture("")
	frame.CloseButton:SetPushedTexture("")
	frame.CloseButton:SetHighlightTexture("")
	frame.CloseButton.t = frame.CloseButton:CreateFontString(nil, "OVERLAY")
	frame.CloseButton.t:FontTemplate(E["media"].dtFont, E.db.core.dtfontsize,  E.db.core.dtfontoutline)
	frame.CloseButton.t:SetPoint("CENTER", 0, 1)
	frame.CloseButton.t:SetText("X")
	
	S:HandleScrollBar(Recount_MainWindow_ScrollBarScrollBar)
	
	frame.Title:SetPoint("TOPLEFT",frame,"TOPLEFT",7,-11)
	frame.Title:FontTemplate(E["media"].dtFont, E.db.core.dtfontsize,  E.db.core.dtfontoutline)
	frame.Title:SetTextColor(unpack(E["media"].rgbvaluecolor))
	frame:SetBackdrop(nil)
end

local function LoadSkin()
	if E.db.skins.recount.enable ~= true then return end
	-- Override bar textures
	Recount.UpdateBarTextures = function(self)
		for k, v in pairs(Recount.MainWindow.Rows) do
			v.StatusBar:GetStatusBarTexture():SetHorizTile(false)
			v.StatusBar:GetStatusBarTexture():SetVertTile(false)
		end
	end

	-- Skin frames when they're created
	Recount.CreateFrame_ = Recount.CreateFrame
	Recount.CreateFrame = function(self, Name, Title, Height, Width, ShowFunc, HideFunc)
		local frame = self:CreateFrame_(Name, Title, Height, Width, ShowFunc, HideFunc)
		SkinFrame2(frame)
		return frame
	end

	if Recount.MainWindow then SkinFrame(Recount.MainWindow) end
	if Recount.ConfigWindow then SkinFrame2(Recount.ConfigWindow) end
	if Recount.GraphWindow then SkinFrame2(Recount.GraphWindow) end
	if Recount.DetailWindow then SkinFrame2(Recount.DetailWindow) end
	if Recount.ResetFrame then SkinFrame2(Recount.ResetFrame) end
	if _G["Recount_Realtime_!RAID_DAMAGE"] then SkinFrame2(_G["Recount_Realtime_!RAID_DAMAGE"].Window) end
	if _G["Recount_Realtime_!RAID_HEALING"] then SkinFrame2(_G["Recount_Realtime_!RAID_HEALING"].Window) end
	if _G["Recount_Realtime_!RAID_HEALINGTAKEN"] then SkinFrame2(_G["Recount_Realtime_!RAID_HEALINGTAKEN"].Window) end
	if _G["Recount_Realtime_!RAID_DAMAGETAKEN"] then SkinFrame2(_G["Recount_Realtime_!RAID_DAMAGETAKEN"].Window) end
	if _G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"] then SkinFrame2(_G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"].Window) end
	if _G["Recount_Realtime_FPS_FPS"] then SkinFrame2(_G["Recount_Realtime_FPS_FPS"].Window) end
	if _G["Recount_Realtime_Latency_LAG"] then SkinFrame2(_G["Recount_Realtime_Latency_LAG"].Window) end
	if _G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"] then SkinFrame2(_G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"].Window) end
	if _G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"] then SkinFrame2(_G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"].Window) end
	
	-- skin dropdown
	Recount.MainWindow.FileButton:HookScript("OnClick", function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end)
	
	-- skin the buttons o main window (Credit Tukz)
	local PB = Recount.MainWindow.CloseButton
	local MWbuttons = {
		Recount.MainWindow.RightButton,
		Recount.MainWindow.LeftButton,
		Recount.MainWindow.ResetButton,
		Recount.MainWindow.FileButton,
		Recount.MainWindow.ConfigButton,
		Recount.MainWindow.ReportButton,
	}

	for i = 1, getn(MWbuttons) do
		local button = MWbuttons[i]
		if button then
			--button:SetTemplate("Default")
			button:SetNormalTexture("")
			button:SetPushedTexture("")	
			button:SetHighlightTexture("")
			button:SetSize(16, 16)
			button.text = button:CreateFontString(nil, 'OVERLAY')
			button.text:FontTemplate(E["media"].dtFont, E.db.core.dtfontsize,  E.db.core.dtfontoutline)
			button.text:SetPoint("CENTER", 1, 1)
			button:ClearAllPoints()
			button:SetPoint("RIGHT", PB, "LEFT", -2, 0)
			PB = button
		end
	end

	-- set our custom text inside main window buttons
	Recount.MainWindow.RightButton.text:SetText(E.ValColor..">")
	Recount.MainWindow.LeftButton.text:SetText(E.ValColor.."<")
	Recount.MainWindow.ResetButton.text:SetText(E.ValColor.."R")
	Recount.MainWindow.FileButton.text:SetText(E.ValColor.."F")
	Recount.MainWindow.ConfigButton.text:SetText(E.ValColor.."C")
	Recount.MainWindow.ReportButton.text:SetText(E.ValColor.."S")

	if E.db.skins.recount.embed then
		local Recount_Skin = CreateFrame("Frame")
		Recount_Skin:RegisterEvent("PLAYER_ENTERING_WORLD")
		Recount_Skin:SetScript("OnEvent", function(self)
		self:UnregisterAllEvents()
		self = nil

		Recount_MainWindow:ClearAllPoints()
		Recount_MainWindow:SetPoint("TOPLEFT", RecountPanel,"TOPLEFT", 0, 6)
		Recount_MainWindow:SetPoint("BOTTOMRIGHT", RecountPanel,"BOTTOMRIGHT", 0, 0)
		Recount.db.profile.MainWindowWidth = (E.db.core.panelWidth - 5)	
		Recount.db.profile.Locked = true
		Recount.db.profile.Font = "ElvUI Font"
		Recount.db.profile.BarTexture = "Ruben"
	end)
end

end

S:RegisterSkin('Recount', LoadSkin)