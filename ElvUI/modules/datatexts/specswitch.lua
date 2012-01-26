local E, L, DF = unpack(select(2, ...)); --Engine
local DT = E:GetModule('DataTexts')

local displayString = '';

local function Update(self, t)
	if not GetPrimaryTalentTree() then
		self.text:SetText(L['No Talents']) 
	else
		local majorTree = GetPrimaryTalentTree()
		local tree1num = select(5,GetTalentTabInfo(1))
		local tree2num = select(5,GetTalentTabInfo(2))
		local tree3num = select(5,GetTalentTabInfo(3))
		local tree = select(2,GetTalentTabInfo(majorTree)) or ""
		self.text:SetFormattedText(displayString, tree, tree1num, tree2num, tree3num)
		--self.text:SetText(E.ValColor..tree..":|r "..tree1num.."/"..tree2num.."/"..tree3num.."|r")
	end
end

local function OnEvent(self, event, ...)
	lastPanel = self
	self:SetScript("OnUpdate", Update)
end

local function Click()
		c = GetActiveTalentGroup(false,false)
		SetActiveTalentGroup(c == 1 and 2 or 1)
end

local function OnEnter(self)
	DT:SetupTooltip(self)	
	if not InCombatLockdown() then			
		local c = GetActiveTalentGroup(false,false)
		local group1tree1 = select(5,GetTalentTabInfo(1,false,false,1))
		local group1tree2 = select(5,GetTalentTabInfo(2,false,false,1))
		local group1tree3 = select(5,GetTalentTabInfo(3,false,false,1))
		local majorTree1 = GetPrimaryTalentTree(false,false,1)
		local hs = (GetNumTalentGroups() == 2 and GetPrimaryTalentTree(false,false,2))
		local group2tree1 = hs and select(5,GetTalentTabInfo(1,false,false,2))
		local group2tree2 = hs and select(5,GetTalentTabInfo(2,false,false,2))
		local group2tree3 = hs and select(5,GetTalentTabInfo(3,false,false,2))
		local majorTree2 = 0
		if hs then
			majorTree2 = GetPrimaryTalentTree(false,false,2)
		end
			
		local green = "|cff00ff00("..ACTIVE_PETS..")"
		local red = "|cffff0000 "
		if majorTree1 and group1tree1 and group1tree2 and group1tree3 then
			GameTooltip:AddDoubleLine("|cffffff00"..COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATESPEC1 ..":|r " .. select(2,GetTalentTabInfo(majorTree1)).." ("..group1tree1.."/"..group1tree2.."/"..group1tree3..")",(c == 1 and green or red) .. "|r",1,1,1)
		end
		if majorTree2 and group2tree1 and group2tree2 and group2tree3 then
			GameTooltip:AddDoubleLine("|cffffff00"..COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATESPEC2 ..":|r ".. select(2,GetTalentTabInfo(majorTree2)).." ("..group2tree1.."/"..group2tree2.."/"..group2tree3..")",(c == 2 and green or red) .. "|r",1,1,1)
		end
		GameTooltip:Show()
	end
end

local function ValueColorUpdate(hex, r, g, b)
	displayString = string.join("", "|cffFFFFFF%s:|r ", hex, "%d|r/", hex, "%d|r/", hex, "%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
]]
DT:RegisterDatatext('SpecSwitch', {'PLAYER_ENTERING_WORLD', 'CONFIRM_TALENT_WIPE', 'PLAYER_TALENT_UPDATE', 'ACTIVE_TALENT_GROUP_CHANGED'}, OnEvent, Update, Click, OnEnter)
