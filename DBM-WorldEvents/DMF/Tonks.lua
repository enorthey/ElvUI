local mod	= DBM:NewMod("Tonks", "DBM-WorldEvents", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 7428 $"):sub(12, -3))
mod:SetZone()

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS",
	"UNIT_SPELLCAST_SUCCEEDED",
	"UNIT_DIED",
	"UNIT_EXITED_VEHICLE"
)

local warnMarked				= mod:NewSpellAnnounce(102341, 4)

local specWarnMarked			= mod:NewSpecialWarningRun(102341)

local timerGame					= mod:NewBuffActiveTimer(60, 102178)

local countdownGame				= mod:NewCountdown(60, 102178)

local soundMarked				= mod:NewSound(102341)

mod:RemoveOption("HealthFrame")
mod:RemoveOption("SpeedKillTimer")

local antiSpam = 0

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(102341) and UnitGUID("pet") == args.destGUID and GetTime() - antiSpam > 3 then
		warnMarked:Show()
		specWarnMarked:Show()
		soundMarked:Play()
		antiSpam = GetTime()
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, spellName)
	if uId ~= "player" then return end
	if spellName == GetSpellInfo(102178) then
		timerGame:Start()
		countdownGame:Start(60)
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 54588 and UnitGUID("pet") == args.destGUID then
		timerGame:Cancel()
		countdownGame:Cancel()
	end
end

function mod:UNIT_EXITED_VEHICLE(uId)
	if uId == "player" then 
		timerGame:Cancel()
		countdownGame:Cancel()
	end
end
