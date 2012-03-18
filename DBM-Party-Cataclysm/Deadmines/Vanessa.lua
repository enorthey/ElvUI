local mod	= DBM:NewMod("Vanessa", "DBM-Party-Cataclysm", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 6612 $"):sub(12, -3))
mod:SetCreatureID(49541)
mod:SetModelID(32806)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS"
)

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED"
)

local warnDeflection	= mod:NewSpellAnnounce(92614, 3)
local warnDeadlyBlades	= mod:NewSpellAnnounce(92622, 3)
--local warnVengeance	= mod:NewSpellAnnounce(95542, 4)--mechanic reworked in 4.0.6, commenting out til warning can be redesigned as well, right now good chance it'll spam A LOT

local timerDeflection	= mod:NewBuffActiveTimer(10, 92614)
local timerDeadlyBlades	= mod:NewBuffActiveTimer(5, 92622)

local timerGauntlet		= mod:NewAchievementTimer(300, 5371, "achievementGauntlet")

function mod:OnCombatStart(delay)
	timerGauntlet:Cancel()
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(92614) then
		warnDeflection:Show()
		timerDeflection:Start()
	elseif args:IsSpellID(92622) then
		warnDeadlyBlades:Show()
		timerDeadlyBlades:Start()
--[[	elseif args:IsSpellID(95542) then
		warnVengeance:Show()--]]
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(92100) then
		timerGauntlet:Start()
	end
end