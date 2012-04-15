local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

local function SkinFrame(frame)
	frame.bgMain = CreateFrame("Frame", nil, frame)
	frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
	frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
	frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -30)
	frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
	frame.bgMain:SetScale(1)
	frame.bgMain.SetScale = E.noop
	
	frame.bgTitle = CreateFrame('Frame', nil, frame)
	frame.bgTitle:SetTemplate('Default', true)
	frame.bgTitle:Point("TOPRIGHT", frame, "TOPRIGHT", 0, -10)
	frame.bgTitle:Point("TOPLEFT", frame, "TOPLEFT", 0, -6)
	frame.bgTitle:Point("BOTTOM", frame, "TOP", 0, -28)
	frame.bgTitle:SetFrameLevel(frame:GetFrameLevel())
	frame.bgTitle:SetScale(1)
	frame.bgTitle.SetScale = E.noop
	
	frame.Title:SetPoint("TOPLEFT",frame,"TOPLEFT",7,-11)
	frame.Title:FontTemplate(E["media"].dtFont, E.db.general.dtfontsize,  E.db.general.dtfontoutline)
	frame.Title:SetTextColor(unpack(E["media"].rgbvaluecolor))
	
	frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -7)
	if frame ~= Recount_MainWindow then
		S:HandleCloseButton(frame.CloseButton)
	end
	S:HandleScrollBar(Recount_MainWindow_ScrollBarScrollBar)
	frame:SetBackdrop(nil)
end

local function SkinFrame2(frame)
	frame.bgMain = CreateFrame("Frame", nil, frame)
	frame.bgMain:SetTemplate("Default")
	frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
	frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
	frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -30)
	frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
	frame.bgMain:SetScale(1)
	frame.bgMain.SetScale = E.noop
	
	frame.bgTitle = CreateFrame('Frame', nil, frame)
	frame.bgTitle:SetTemplate('Default', true)
	frame.bgTitle:Point("TOPRIGHT", frame, "TOPRIGHT", 0, -10)
	frame.bgTitle:Point("TOPLEFT", frame, "TOPLEFT", 0, -6)
	frame.bgTitle:Point("BOTTOM", frame, "TOP", 0, -28)
	frame.bgTitle:SetFrameLevel(frame:GetFrameLevel())
	frame.bgTitle:SetScale(1)
	frame.bgTitle.SetScale = E.noop
	
	frame.Title:SetPoint("TOPLEFT",frame,"TOPLEFT",7,-11)
	frame.Title:FontTemplate(E["media"].dtFont, E.db.general.dtfontsize,  E.db.general.dtfontoutline)
	frame.Title:SetTextColor(unpack(E["media"].rgbvaluecolor))
	
	frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -7)
	if frame ~= Recount_MainWindow then
		S:HandleCloseButton(frame.CloseButton)
	end
	S:HandleScrollBar(Recount_MainWindow_ScrollBarScrollBar)
	frame:SetBackdrop(nil)
end

local function LoadSkin()
	if E.global.skins.recount.enable ~= true then return end
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
	
	Recount.HideScrollbarElements_ = Recount.HideScrollbarElements
	Recount.ShowScrollbarElements_ = Recount.ShowScrollbarElements
	
	function Recount.ShowScrollbarElements(self, name)
		local scrollbar=getglobal(name.."ScrollBar")
		scrollbar:Show()
		Recount.ShowScrollbarElements_(self, name)
	end

	function Recount.HideScrollbarElements(self, name)
		local scrollbar=getglobal(name.."ScrollBar")
		scrollbar:Hide()
		Recount.HideScrollbarElements_(self, name)
	end	
	
	if Recount.db.profile.MainWindow.ShowScrollbar then
		Recount:ShowScrollbarElements("Recount_MainWindow_ScrollBar")
	else
		Recount:HideScrollbarElements("Recount_MainWindow_ScrollBar")
	end 
	
	-- skin the buttons o main window
	local MWbuttons = {
		Recount.MainWindow.CloseButton,
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
			button:GetNormalTexture():SetDesaturated(true)
			button:GetHighlightTexture():SetDesaturated(true)
		end
	end

	Recount.db.profile.Locked = true
	Recount.db.profile.Font = "ElvUI Font"
	Recount.db.profile.BarTexture = "Ruben"		
	
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
end

S:RegisterSkin('Recount', LoadSkin)