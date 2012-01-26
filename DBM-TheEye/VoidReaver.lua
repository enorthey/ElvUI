local mod	= DBM:NewMod("VoidReaver", "DBM-TheEye")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 334 $"):sub(12, -3))
mod:SetCreatureID(19516)
mod:SetModelID(18951)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS"
)

local warnOrb			= mod:NewTargetAnnounce(34172, 3)
local warnKnockBack		= mod:NewSpellAnnounce(25778, 3)
local warnPounding		= mod:NewSpellAnnounce(34162, 3)

local specWarnOrb		= mod:NewSpecialWarningMove(34172)

local timerKnockBack	= mod:NewCDTimer(20, 25778)
local timerPounding		= mod:NewCDTimer(13, 34162)

local berserkTimer		= mod:NewBerserkTimer(600)

mod:AddBoolOption("YellOnOrb", true, "announce")

function mod:OnCombatStart(delay)
	timerPounding:Start()
	berserkTimer:Start(-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(34172) then
		warnOrb:Show(args.destName)
		if args:IsPlayer() then
			specWarnOrb:Show()
			if self.Options.YellOnOrb then
				SendChatMessage(L.YellOrb, "SAY")
			end
		end
	elseif args:IsSpellID(34162) then
		warnPounding:Show()
		timerPounding:Start()
	elseif args:IsSpellID(25778) then
		warnKnockBack:Show()
		timerKnockBack:Start()
	end
end
