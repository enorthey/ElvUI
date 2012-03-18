local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local LO = E:NewModule('Layout', 'AceEvent-3.0');

local PANEL_HEIGHT = 22;
local SIDE_BUTTON_WIDTH = 16;
local UPPER_PANEL_HEIGHT = 21;
local LOWER_PANEL_HEIGHT = 21;

E.Layout = LO;

function LO:Initialize()
	self:CreateChatPanels()
	self:CreateMinimapPanels()
	self:CreateUpperLowerPanels()
	if E.global.general.dtlowerpanel then self.CreateLowerDPPanel() end	
end

local function ChatPanelLeft_OnFade(self)
	LeftChatPanel:Hide()
end

local function ChatPanelRight_OnFade(self)
	RightChatPanel:Hide()
end

local function ChatButton_OnEnter(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		self.parent:Show()
		UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
	end
	
	if self == LeftChatToggleButton then
		GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT', 0, 4)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(L['Left Click:'], L['Toggle Chat Frame'], 1, 1, 1)
	else
		GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT', 0, 4)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(L['Left Click:'], L['Toggle Chat Frame'], 1, 1, 1)
		GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
	end

	GameTooltip:Show()	
end

local function ChatButton_OnLeave(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
	end
	GameTooltip:Hide()
end

local function ChatButton_OnClick(self, btn)
	GameTooltip:Hide()
	if btn == 'RightButton' then
		if IsAddOnLoaded('Recount') and E.db.skins.embedRight == 'Recount' then
			ToggleFrame(Recount_MainWindow)
		elseif IsAddOnLoaded('Omen') and E.db.skins.embedRight == 'Omen' then
			ToggleFrame(OmenAnchor)
		elseif IsAddOnLoaded('Skada') and E.db.skins.embedRight == 'Skada' then
			Skada:ToggleWindow()
		end
	else
		if E.db[self.parent:GetName()..'Faded'] then
			E.db[self.parent:GetName()..'Faded'] = nil
			UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
			UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
		else
			E.db[self.parent:GetName()..'Faded'] = true
			UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
			UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
			self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
		end
	end
end

function HideLeftChat()
	ChatButton_OnClick(LeftChatToggleButton)
end

function HideRightChat()
	ChatButton_OnClick(RightChatToggleButton)
end

function HideBothChat()
	ChatButton_OnClick(LeftChatToggleButton)
	ChatButton_OnClick(RightChatToggleButton)
end

function LO:ToggleChatPanels()
	LeftChatDataPanel:ClearAllPoints()
	RightChatDataPanel:ClearAllPoints()
	if E.db.general.panelBackdrop == 'SHOWBOTH' then
		LeftChatPanel.backdrop:Show()
		LeftChatTab:Show()
		RightChatPanel.backdrop:Show()
		RightChatTab:Show()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 5 + SIDE_BUTTON_WIDTH, 5)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -5, (5 + PANEL_HEIGHT))		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', 5, 5)
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -(5 + SIDE_BUTTON_WIDTH), 5 + PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 5, 5)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', -5, 5)
	elseif E.db.general.panelBackdrop == 'HIDEBOTH' then
		LeftChatPanel.backdrop:Hide()
		LeftChatTab:Hide()
		RightChatPanel.backdrop:Hide()
		RightChatTab:Hide()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 0)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', 0, PANEL_HEIGHT)		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT')
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT')
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT')
	elseif E.db.general.panelBackdrop == 'LEFT' then
		LeftChatPanel.backdrop:Show()
		LeftChatTab:Show()
		RightChatPanel.backdrop:Hide()
		RightChatTab:Hide()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 5 + SIDE_BUTTON_WIDTH, 5)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -5, (5 + PANEL_HEIGHT))			
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT')
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)			
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 5, 5)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT')
	else
		LeftChatPanel.backdrop:Hide()
		LeftChatTab:Hide()
		RightChatPanel.backdrop:Show()
		RightChatTab:Show()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 0)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', 0, PANEL_HEIGHT)			
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', 5, 5)
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -(5 + SIDE_BUTTON_WIDTH), 5 + PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT')
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', -5, 5)
	end
end

function LO:CreateChatPanels()
	--Left Chat
	local lchat = CreateFrame('Frame', 'LeftChatPanel', E.UIParent)
	if not E.db.general.UpperLowerPanels then 
		lchat:SetFrameStrata('BACKGROUND') 
	end
	lchat:Size(E.db.general.panelWidth, E.db.general.panelHeight)	
	lchat:Point('BOTTOMLEFT', E.UIParent, 4, 4)
	lchat:CreateBackdrop('Transparent')
	lchat.backdrop:SetAllPoints()
	
	--Background Texture
	lchat.tex = lchat:CreateTexture(nil, 'OVERLAY')
	lchat.tex:Point('TOPLEFT', lchat, 'TOPLEFT', 2, -2)
	lchat.tex:Point('BOTTOMRIGHT', lchat, 'BOTTOMRIGHT', -2, 2)
	lchat.tex:SetTexture(E.db.general.panelBackdropNameLeft)
	lchat.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)
	
	--Left Chat Tab
	local lchattab = CreateFrame('Frame', 'LeftChatTab', LeftChatPanel)
	lchattab:Point('TOPLEFT', lchat, 'TOPLEFT', 5, -5)
	lchattab:Point('BOTTOMRIGHT', lchat, 'TOPRIGHT', -5, -(5 + PANEL_HEIGHT))
	lchattab:SetTemplate('Default', true)
	
	--Left Chat Data Panel
	local lchatdp = CreateFrame('Frame', 'LeftChatDataPanel', LeftChatPanel)
	lchatdp:Point('BOTTOMLEFT', lchat, 'BOTTOMLEFT', 5 + SIDE_BUTTON_WIDTH, 5)
	lchatdp:Point('TOPRIGHT', lchat, 'BOTTOMRIGHT', -5, (5 + PANEL_HEIGHT))
	lchatdp:SetTemplate('Default', true)
	E:GetModule('DataTexts'):RegisterPanel(lchatdp, 3, 'ANCHOR_TOPLEFT', -17, 4)
	
	--Left Chat Toggle Button
	local lchattb = CreateFrame('Button', 'LeftChatToggleButton', E.UIParent)
	lchattb.parent = LeftChatPanel
	LeftChatPanel.fadeFunc = ChatPanelLeft_OnFade
	lchattb:Point('TOPRIGHT', lchatdp, 'TOPLEFT', -1, 0)
	lchattb:Point('BOTTOMLEFT', lchat, 'BOTTOMLEFT', 5, 5)
	lchattb:SetTemplate('Default', true)
	lchattb:SetScript('OnEnter', ChatButton_OnEnter)
	lchattb:SetScript('OnLeave', ChatButton_OnLeave)
	lchattb:SetScript('OnClick', ChatButton_OnClick)
	lchattb.text = lchattb:CreateFontString(nil, 'OVERLAY')
	lchattb.text:FontTemplate(E["media"].dtFont, E.db.general.dtfontsize,  E.db.general.dtfontoutline)
	lchattb.text:SetPoint('CENTER', 2, 0)
	lchattb.text:SetJustifyH('CENTER')
	lchattb.text:SetText('<')
	
	--Right Chat
	local rchat = CreateFrame('Frame', 'RightChatPanel', E.UIParent)
	if not E.db.general.UpperLowerPanels then
		rchat:SetFrameStrata('BACKGROUND')
	end
	rchat:Size(E.db.general.panelWidth, E.db.general.panelHeight)
	rchat:Point('BOTTOMRIGHT', E.UIParent, -4, 4)
	rchat:CreateBackdrop('Transparent')
	rchat.backdrop:SetAllPoints()
	
	--Background Texture
	rchat.tex = rchat:CreateTexture(nil, 'OVERLAY')
	rchat.tex:Point('TOPLEFT', rchat, 'TOPLEFT', 2, -2)
	rchat.tex:Point('BOTTOMRIGHT', rchat, 'BOTTOMRIGHT', -2, 2)
	rchat.tex:SetTexture(E.db.general.panelBackdropNameRight)
	rchat.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)	
	
	--Right Chat Tab
	local rchattab = CreateFrame('Frame', 'RightChatTab', RightChatPanel)
	rchattab:Point('TOPRIGHT', rchat, 'TOPRIGHT', -5, -5)
	rchattab:Point('BOTTOMLEFT', rchat, 'TOPLEFT', 5, -(5 + PANEL_HEIGHT))
	rchattab:SetTemplate('Default', true)
	
	--Right Chat Data Panel
	local rchatdp = CreateFrame('Frame', 'RightChatDataPanel', RightChatPanel)
	rchatdp:Point('BOTTOMLEFT', rchat, 'BOTTOMLEFT', 5, 5)
	rchatdp:Point('TOPRIGHT', rchat, 'BOTTOMRIGHT', -(5 + SIDE_BUTTON_WIDTH), 5 + PANEL_HEIGHT)
	rchatdp:SetTemplate('Default', true)
	E:GetModule('DataTexts'):RegisterPanel(rchatdp, 3, 'ANCHOR_TOPRIGHT', 17, 4)
	
	--Right Chat Toggle Button
	local rchattb = CreateFrame('Button', 'RightChatToggleButton', E.UIParent)
	rchattb.parent = RightChatPanel
	RightChatPanel.fadeFunc = ChatPanelRight_OnFade
	rchattb:Point('TOPLEFT', rchatdp, 'TOPRIGHT', 1, 0)
	rchattb:Point('BOTTOMRIGHT', rchat, 'BOTTOMRIGHT', -5, 5)
	rchattb:SetTemplate('Default', true)
	rchattb:RegisterForClicks('AnyUp')
	rchattb:SetScript('OnEnter', ChatButton_OnEnter)
	rchattb:SetScript('OnLeave', ChatButton_OnLeave)
	rchattb:SetScript('OnClick', ChatButton_OnClick)
	rchattb.text = rchattb:CreateFontString(nil, 'OVERLAY')
	rchattb.text:FontTemplate(E["media"].dtFont, E.db.general.dtfontsize,  E.db.general.dtfontoutline)
	rchattb.text:SetPoint('CENTER', 2, 0)
	rchattb.text:SetJustifyH('CENTER')
	rchattb.text:SetText('>')
	
	--Load Settings
	if E.db['LeftChatPanelFaded'] then
		LeftChatToggleButton:SetAlpha(0)
		LeftChatPanel:Hide()
	end	
	
	if E.db['RightChatPanelFaded'] then
		RightChatToggleButton:SetAlpha(0)
		RightChatPanel:Hide()
	end		
	
	self:ToggleChatPanels()
end

function LO:CreateMinimapPanels()
	local lminipanel = CreateFrame('Frame', 'LeftMiniPanel', Minimap)
	lminipanel:Point('TOPLEFT', Minimap, 'BOTTOMLEFT', -2, -3)
	lminipanel:Point('BOTTOMRIGHT', Minimap, 'BOTTOM', -1, -(3 + PANEL_HEIGHT))
	lminipanel:SetTemplate('Default', true)
	E:GetModule('DataTexts'):RegisterPanel(lminipanel, 1, 'ANCHOR_BOTTOMLEFT', lminipanel:GetWidth() * 2, -4)
	
	local rminipanel = CreateFrame('Frame', 'RightMiniPanel', Minimap)
	rminipanel:Point('TOPRIGHT', Minimap, 'BOTTOMRIGHT', 2, -3)
	rminipanel:Point('BOTTOMLEFT', Minimap, 'BOTTOM', 0, -(3 + PANEL_HEIGHT))
	rminipanel:SetTemplate('Default', true)
	E:GetModule('DataTexts'):RegisterPanel(rminipanel, 1, 'ANCHOR_BOTTOM', 0, -4)
	
	local configtoggle = CreateFrame('Button', 'ElvConfigToggle', Minimap)
	configtoggle:Point('TOPLEFT', rminipanel, 'TOPRIGHT', 1, 0)
	configtoggle:Point('BOTTOMLEFT', rminipanel, 'BOTTOMRIGHT', 1, 0)
	configtoggle:Width(E.RBRWidth)
	configtoggle:SetTemplate('Default', true)
	configtoggle.text = configtoggle:CreateFontString(nil, 'OVERLAY')
	configtoggle.text:FontTemplate(E["media"].dtFont, E.db.general.dtfontsize,  E.db.general.dtfontoutline)
	configtoggle.text:SetText('C')
	configtoggle.text:SetPoint('CENTER', 2, 1)
	configtoggle.text:SetJustifyH('CENTER')
	configtoggle:SetScript('OnClick', function() E:ToggleConfig() end)
end

function LO:ToggleUpperLowerPanels()
	if E.db.general.UpperLowerPanels == 'SHOWBOTH' then
		LowerPanel:Show()
		UpperPanel:Show()	
	elseif E.db.general.UpperLowerPanels == 'HIDEBOTH' then
		LowerPanel:Hide()
		UpperPanel:Hide()		
	elseif E.db.general.UpperLowerPanels == 'TOP' then
		LowerPanel:Hide()
		UpperPanel:Show()		
	else
		LowerPanel:Show()
		UpperPanel:Hide()		
	end
end

function LO:CreateUpperLowerPanels()
	local lpanel = CreateFrame('Frame', 'LowerPanel', E.UIParent)
	lpanel:SetFrameStrata('BACKGROUND')
	lpanel:Width(E.screenwidth)
	lpanel:Height(LOWER_PANEL_HEIGHT)
	lpanel:Point("BOTTOMLEFT", E.UIParent, "BOTTOMLEFT", -E.mult, -E.mult)
	lpanel:Point("BOTTOMRIGHT", E.UIParent, "BOTTOMRIGHT", E.mult, -E.mult)
	lpanel:SetTemplate('Default')	
	
	local upanel = CreateFrame('Frame', 'UpperPanel', E.UIParent)
	upanel:SetFrameStrata('BACKGROUND')
	upanel:Width(E.screenwidth)
	upanel:Height(UPPER_PANEL_HEIGHT)
	upanel:Point("TOPLEFT", E.UIParent, "TOPLEFT", -E.mult, E.mult)
	upanel:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", E.mult, E.mult)
	upanel:SetTemplate('Default')		
	
	self:ToggleUpperLowerPanels()
end

function LO:CreateLowerDPPanel()
	local lcdppanel = CreateFrame('Frame', 'LowerCDPPanel', E.UIParent)
	lcdppanel:Width(436)
	lcdppanel:Height(PANEL_HEIGHT)
	lcdppanel:Point("BOTTOM", E.UIParent, "BOTTOM", 0, 9)
	lcdppanel:SetTemplate('Default', true)	
	E:GetModule('DataTexts'):RegisterPanel(lcdppanel, 3, 'ANCHOR_TOPLEFT', 0, 4)
	
	local lldppanel = CreateFrame('Frame', 'LowerLDPPanel', E.UIParent)
	lldppanel:Width(220)
	lldppanel:Height(PANEL_HEIGHT)
	lldppanel:Point("RIGHT", LowerCDPPanel, "LEFT", -3, 0)
	lldppanel:SetTemplate('Default', true)	
	E:GetModule('DataTexts'):RegisterPanel(lldppanel, 1, 'ANCHOR_TOPLEFT', 0, 4)

	local lrdppanel = CreateFrame('Frame', 'LowerRDPPanel', E.UIParent)
	lrdppanel:Width(220)
	lrdppanel:Height(PANEL_HEIGHT)
	lrdppanel:Point("LEFT", LowerCDPPanel, "RIGHT", 3, 0)
	lrdppanel:SetTemplate('Default', true)	
	E:GetModule('DataTexts'):RegisterPanel(lrdppanel, 1, 'ANCHOR_TOPRIGHT', 0, 4)
end

function LO:CreateFilgerPanels()	
	local PlayerBuffs = CreateFrame('Frame', 'FilgerPlayerBuffs', E.UIParent)
	PlayerBuffs:Point('CENTER', E.UIParent, 'CENTER', -300, -62)
	PlayerBuffs:Size(150, 36)
	E:CreateMover(PlayerBuffs, 'PlayerBuffsMover', 'Move Player Buffs')
	
	local PlayerDebuffs = CreateFrame('Frame', 'FilgerPlayerDebuffs', E.UIParent)
	PlayerDebuffs:Point('CENTER', E.UIParent, 'CENTER', -300, 0)
	PlayerDebuffs:Size(150, 72)
	E:CreateMover(PlayerDebuffs, 'PlayerDebuffsMover', 'Move Player debuffs')
	
	local PlayerProccs = CreateFrame('Frame', 'FilgerPlayerProccs', E.UIParent)
	PlayerProccs:Point('CENTER', E.UIParent, 'CENTER', -300, -203)
	PlayerProccs:Size(150, 32)
	E:CreateMover(PlayerProccs, 'PlayerProccsMover', 'Move Player Proccs')
	
	local PlayerHealBuffs = CreateFrame('Frame', 'FilgerPlayerHealBuffs', E.UIParent)
	PlayerHealBuffs:Point('CENTER', E.UIParent, 'CENTER', -300, -104)
	PlayerHealBuffs:Size(150, 32)
	E:CreateMover(PlayerHealBuffs, 'PlayerHealBuffsMover', 'Move Heal/CD Frame')
	
	local TargetDebuffs = CreateFrame('Frame', 'FilgerTargetDebuffs', E.UIParent)
	TargetDebuffs:Point('CENTER', E.UIParent, 'CENTER', 300, -62)
	TargetDebuffs:Size(150, 36)
	E:CreateMover(TargetDebuffs, 'TargetDebuffsMover', 'Move Target Debuffs')
	
	local TargetHeals = CreateFrame('Frame', 'FilgerTargetHeals', E.UIParent)
	TargetHeals:Point('CENTER', E.UIParent, 'CENTER', 300, -104)
	TargetHeals:Size(150, 32)
	E:CreateMover(TargetHeals, 'TargetHealsMover', 'Move Target Heals')
	
	local PvPBuffs = CreateFrame('Frame', 'FilgerPvPBuffs', E.UIParent)
	PvPBuffs:Point('CENTER', E.UIParent, 'CENTER', 300, 0)
	PvPBuffs:Size(150, 72)
	E:CreateMover(PvPBuffs, 'CreateMoverMover', 'Move PvP Buffs')
	
	local WLBuffs = CreateFrame('Frame', 'FilgerWLBuffs', E.UIParent)
	WLBuffs:Point('CENTER', E.UIParent, 'CENTER', 0, 145)
	WLBuffs:Size(150, 50)
	E:CreateMover(WLBuffs, 'WLBuffsMover', 'Move WL Buffs')
	
	local DebuffBars = CreateFrame('Frame', 'FilgerDebuffBars', E.UIParent)
	DebuffBars:Point('CENTER', E.UIParent, 'CENTER', 300, 145)
	DebuffBars:Size(150, 50)
	E:CreateMover(DebuffBars, 'DebuffBarsMover', 'Move Debuff Bars')
	
	local CDBars = CreateFrame('Frame', 'FilgerCDBars', E.UIParent)
	CDBars:Point('CENTER', E.UIParent, 'CENTER', -300, 145)
	CDBars:Size(150, 50)
	E:CreateMover(CDBars, 'CDBarsMover', 'Move CD Bars')
end

E:RegisterModule(LO:GetName())