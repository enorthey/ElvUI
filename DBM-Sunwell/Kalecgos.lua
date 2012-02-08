local mod	= DBM:NewMod("Kal", "DBM-Sunwell")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 369 $"):sub(12, -3))
mod:SetCreatureID(24850)
mod:SetModelID(26628)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"UNIT_DIED"
)

local warnPortal		= mod:NewAnnounce("WarnPortal", 4, 46021)
local warnBuffet		= mod:NewSpellAnnounce(45018, 3)
local warnBreath		= mod:NewSpellAnnounce(44799, 3, nil, false)
local warnCorrupt		= mod:NewTargetAnnounce(45029, 3)

local specWarnWildMagic	= mod:NewSpecialWarning("SpecWarnWildMagic")

local timerNextPortal	= mod:NewTimer(25, "TimerNextPortal", 46021)
local timerBreathCD		= mod:NewCDTimer(15, 44799, false)
local timerBuffetCD		= mod:NewCDTimer(8, 45018)
local timerPorted		= mod:NewBuffActiveTimer(60, 46021)
local timerExhausted	= mod:NewBuffActiveTimer(60, 44867)

mod:AddBoolOption("HealthFrame", true)
mod:AddBoolOption("RangeFrame", true)
mod:AddBoolOption("ShowFrame", true)
mod:AddBoolOption("FrameLocked", false)
mod:AddBoolOption("FrameClassColor", true, nil, function()
	mod:UpdateColors()
end)
mod:AddBoolOption("FrameUpwards", false, nil, function()
	mod:ChangeFrameOrientation()
end)

mod.Options.FramePoint = "CENTER"
mod.Options.FrameX = 150
mod.Options.FrameY = -50

local portCount = 1
local buffetSpam = 0
local lastPortal = 0

function mod:OnCombatStart(delay)
	portCount = 1
	buffetSpam = 0
	lastPortal = 0
	DBM.BossHealth:Clear()
	DBM.BossHealth:AddBoss(24850, L.name)
	DBM.BossHealth:AddBoss(24892, L.Demon)
	if self.Options.ShowFrame then
		self:CreateFrame()
	end
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show()
	end
end

function mod:OnCombatEnd()
	self:DestroyFrame()
	DBM.BossHealth:Clear()
	DBM.RangeCheck:Hide()
end


function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(44987) and args:IsPlayer() and self:IsHealer() then
		specWarnWildMagic:Show(L.Heal)
	elseif args:IsSpellID(45001) and args:IsPlayer() then
		specWarnWildMagic:Show(L.Haste)
	elseif args:IsSpellID(45002) and args:IsPlayer() and self:IsMelee() then
		specWarnWildMagic:Show(L.Hit)
	elseif args:IsSpellID(45004) and args:IsPlayer() and not self:IsHealer() then
		specWarnWildMagic:Show(L.Crit)
	elseif args:IsSpellID(45006) and args:IsPlayer() and not self:IsHealer() then
		specWarnWildMagic:Show(L.Aggro)
	elseif args:IsSpellID(45010) and args:IsPlayer() then
		specWarnWildMagic:Show(L.Mana)
	elseif args:IsSpellID(45018) and GetTime() - buffetSpam >= 2 then
		warnBuffet:Show()
		timerBuffetCD:Start()
		buffetSpam = GetTime()
	elseif args:IsSpellID(45029) then
		warnCorrupt:Show(args.destName)
	elseif args:IsSpellID(46021) then
		self:AddEntry(("%s (%d)"):format(args.destName, grp or 0), class)
		if args:IsPlayer() then
			timerPorted:Start()
			timerExhausted:Schedule(60)
		end
		if GetTime() - lastPortal >= 20 then
			lastPortal = GetTime()
			local grp, class
			for i = 1, GetNumRaidMembers() do
				local name, _, subgroup, _, _, fileName = GetRaidRosterInfo(i)
				if name == args.destName then
					grp = subgroup
					class = fileName
					break
				end
			end
			warnPortal:Show(portCount, args.destName, grp or 0)
			portCount = portCount + 1
			timerNextPortal:Start(portCount)
		end
	end
end

mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(44799) then
		warnBreath:Show()
		timerBreathCD:Start()
	end
end

function mod:UNIT_DIED(args)
	if self:GetCIDFromGUID(args.destGUID) == 24892 then
		DBM:EndCombat(self)
	end
	if bit.band(args.destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) ~= 0 then
		local grp
		for i = 1, GetNumRaidMembers() do
			local name, _, subgroup = GetRaidRosterInfo(i)
			if name == args.destName then
				grp = subgroup
				break
			end
		end
		self:RemoveEntry(("%s (%d)"):format(args.destName, grp or 0))
	end
end
