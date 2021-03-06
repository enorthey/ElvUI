local mod	= DBM:NewMod("FrostwingHallTrash", "DBM-Icecrown", 4)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4408 $"):sub(12, -3))
mod:SetModelID(31050)

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"CHAT_MSG_MONSTER_YELL"
)

local warnConflag		= mod:NewTargetAnnounce(71785, 4)
local warnBanish		= mod:NewTargetAnnounce(71298, 3)

local specWarnGosaEvent	= mod:NewSpecialWarning("SpecWarnGosaEvent")
local specWarnBlade		= mod:NewSpecialWarningMove(70305)

local timerConflag		= mod:NewTargetTimer(10, 71785)
local timerBanish		= mod:NewTargetTimer(6, 71298)

mod:RemoveOption("HealthFrame")
mod:RemoveOption("SpeedKillTimer")

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(71785) then
		warnConflag:Show(args.destName)
		timerConflag:Start(args.destName)
	elseif args:IsSpellID(71298) then
		warnBanish:Show(args.destName)
		timerBanish:Start(args.destName)
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(71785) then
		timerConflag:Cancel(args.destName)
	elseif args:IsSpellID(71298) then
		timerBanish:Cancel(args.destName)
	end
end

do 
	local lastBlade = 0
	function mod:SPELL_DAMAGE(sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellId)
		if spellId == 70305 and destGUID == UnitGUID("player") and GetTime() - lastBlade > 2 then
			specWarnBlade:Show()
			lastBlade = GetTime()
		end
	end
	mod.SPELL_MISSED = mod.SPELL_DAMAGE
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.SindragosaEvent and self:LatencyCheck() then
		self:SendSync("GauntletStart")
	end
end

function mod:OnSync(msg, arg)
	if msg == "GauntletStart" then
		specWarnGosaEvent:Show()
	end
end